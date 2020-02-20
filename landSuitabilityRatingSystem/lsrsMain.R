#January 24, 2020
#Hayden McAdam
#Read in and clean vector data and call functions to calculate points for
#climate, landscape, and soil factors.

#TODO: 
#Add soil data and functions into this file to be processed
#with the landscape and climate data.
#Improve documentation.
#Calculate the region value in the topography function 
#using slope length (Figure 6.1).

library(raster)
library(foreign)
library(plyr)

source("landscapeFactors/landscapeRatingPoints.R")
source("landscapeFactors/landscapeRatingClass.R")
source("landscapeFactors/topography.R")
source("landscapeFactors/stoniness.R")
source("landscapeFactors/woodContent.R")
source("landscapeFactors/flooding.R")
source("pointsToClass.R")
source("climaticFactors/climateRatingPoints.R")
source("climaticFactors/climateRatingClass.R")
source("climaticFactors/moistureFactor.R")
source("climaticFactors/temperatureFactor.R")
source("climaticFactors/excessSpringMoisture.R")
source("climaticFactors/excessFallMoisture.R")
source("climaticFactors/fallFrost.R")
source("soilFactors/soilRatingPoints.R")
source("soilFactors/soilRatingClass.R")
source("soilFactors/moisture.R")
source("soilFactors/surfaceStructure.R")
source("soilFactors/organicMatterContent.R")
source("soilFactors/reaction.R")
source("soilFactors/salinity.R")
source("soilFactors/sodicity.R")
source("soilFactors/chemistry.R")
source("soilFactors/organicSurface.R")
source("soilFactors/drainage.R")
source("soilFactors/soilTemperature.R")

#Data currently being used.
clTable <- read.csv("../../ab_vector/climate1981x10_CCCS_baseline.csv")
lsTable <- read.csv("dataFiles/landscapeTest2.csv")

#Real landscape vector data.
#lsTable <- read.dbf("../../ab_vector/CFR_slc32_250m.dbf")

#Soil data
slTable <- read.dbf("../../ab_vector/ab_rasterized_slc32_250m.dbf")
#Soil raster data
# slRaster <- raster("../../ab_raster/PSM_SoilGreatGroup_250m.tif")
# slRasterTable <- as.data.frame(slRaster, na.rm=TRUE)

#Landscape factor calculations.
lsRatingTable <- landscapeRatingPoints(lsTable$slc, lsTable$region, lsTable$ps,
                       lsTable$lt, lsTable$cf,
                       lsTable$surface, lsTable$subsurface,
                       lsTable$pattern, lsTable$inundationPeriod,
                       lsTable$usableGrowingSeasonLength, lsTable$frequency)

#lsRatingTable <- subset(lsRatingTable, points >= 0 & points <= 100)

lsRatingTable$class <- landscapeRatingClass(lsRatingTable$points,
                                            lsRatingTable$t, lsRatingTable$p,
                                            lsRatingTable$j, lsRatingTable$k,
                                            lsRatingTable$i)

lsRatingTable <- subset(lsRatingTable, select=-c(t, p, j, k, i))

#Climate factor calculations
clTable <- clTable[c("slc", "ppe", "egdd", "esm", "efm", "eff")]

clRatingTable <- climateRatingPoints(clTable$ppe, clTable$egdd, clTable$esm,
                                      clTable$efm, clTable$eff)

#clRatingTable <- subset(clRatingTable, points >= 0 & points <= 100)

clRatingTable$class <- climateRatingClass(clRatingTable$points,
                                          clRatingTable$a, clRatingTable$h)

# clRatingTable <- subset(clRatingTable, select=-c(moistureDeduction,
#                                  temperatureDeduction, basicClimateRating,
#                                  springMoisture, fallMoisture, fallFrost))

#Soil factor calculations.
#Combine all depth columns for each category into two columns
#for surface and subsurface.
slTable$claySurface <- rowMeans(slTable[,c("CLAY5_V", "CLAY15_V", "CLAY30_V")])
slTable$claySubsurface <- rowMeans(slTable[,c("CLAY60_V", "CLAY100_V")])

slTable$sandSurface <- rowMeans(slTable[,c("SAND5_V", "SAND15_V", "SAND30_V")])
slTable$sandSubsurface <- rowMeans(slTable[,c("SAND60_V", "SAND100_V")])

slTable$siltSurface <- rowMeans(slTable[,c("SILT5_V", "SILT15_V", "SILT30_V")])
slTable$siltSubsurface <- rowMeans(slTable[,c("SILT60_V", "SILT100_V")])

slTable$cfSurface <- rowMeans(slTable[,c("CFRAG5_V", "CFRAG15_V", "CFRAG30_V")])
slTable$cfSubsurface <- rowMeans(slTable[,c("CFRAG60_V", "CFRAG100_V")])

slTable$awhcSurface <- rowMeans(slTable[,c("AWHC5_V", "AWHC15_V", "AWHC30_V")])
slTable$awhcSubsurface <- rowMeans(slTable[,c("AWHC60_V", "AWHC100_V")])

slTable$ocSurfacePerc <- rowMeans(slTable[,c("OC5_V", "OC15_V", "OC30_V")] / 100)

slTable$surfacePH <- rowMeans(slTable[,c("PH5_V", "PH15_V", "PH30_V")])
slTable$subsurfacePH <- rowMeans(slTable[,c("PH60_V", "PH100_V")])

slTable$surfaceEC <- rowMeans(slTable[,c("EC5_V", "EC15_V", "EC30_V")])
slTable$subsurfaceEC <- rowMeans(slTable[,c("EC60_V", "EC100_V")])

slTable$ksatSurface <- rowMeans(slTable[,c("KSAT5_V", "KSAT15_V", "KSAT30_V")])
slTable$ksatSubsurface <- rowMeans(slTable[,c("KSAT60_V", "KSAT100_V")])
#slTable$sarSurface <- with(slTable, ksatSurface / 10)
slTable$sarSurface <- slTable$ksatSurface / 10
# slTable$sarSubsurface <- with(slTable, ksatSubsurface / 10)
slTable$sarSubsurface <- slTable$ksatSubsurface / 10

slTable$bd <- rowMeans(slTable[,c("BD5_V", "BD15_V", "BD30_V")])
#slTable <- transform(slTable, bd = ifelse(bd == 0, 0.12, bd))

#Join the soil and climate tables so ppe and egdd can be used in
#soil calculations.
slTable$slc <- slTable$Value
slTable <- join(slTable, clRatingTable, by="slc", type="inner")

slRatingTable <- soilRatingPoints(slTable$claySurface, slTable$claySubsurface,
                                  slTable$sandSurface, slTable$sandSubsurface,
                                  slTable$siltSurface, slTable$siltSubsurface,
                                  slTable$cfSurface, slTable$cfSubsurface,
                                  slTable$awhcSurface, slTable$awhcSubsurface, 
                                  slTable$ppe, slTable$ocSurfacePerc,
                                  slTable$surfacePH, slTable$subsurfacePH,
                                  slTable$surfaceEC, slTable$subsurfaceEC,
                                  slTable$sarSurface, slTable$sarSubsurface,
                                  slTable$E_DEPTH, slTable$bd, slTable$egdd)

# slRatingTable$class <- soilRatingClass(slRatingTable$points, slRatingTable$m,
#                                        slRatingTable$a, slRatingTable$d,
#                                        slRatingTable$f, slRatingTable$e,
#                                        slRatingTable$v, slRatingTable$n,
#                                        slRatingTable$y, slRatingTable$o,
#                                        slRatingTable$w)
slRatingTable$class <- soilRatingClass(slRatingTable$points, slRatingTable$m,
                                       slRatingTable$a, slRatingTable$d, 
                                       slRatingTable$f, slRatingTable$v, 
                                       slRatingTable$sv, slRatingTable$n, 
                                       slRatingTable$sn, slRatingTable$y, 
                                       slRatingTable$sy)

# slRatingTable <- slRatingTable[c("slc",
#                            "claySurface", "claySubsurface",
#                            "sandSurface", "sandSubsurface",
#                            "siltSurface", "siltSubsurface", "awhcSurface",
#                            "awhcSubsurface", "ppe", "ocSurfacePerc",
#                            "surfacePH", "subsurfacePH",
#                            "surfaceEC", "subsurfaceEC", "points", "class")]

#Write the results into csv files.
# write.csv(lsRatingTable, file="dataFiles/testResults.csv", row.names=FALSE)
# write.csv(clRatingTable, file="dataFiles/climateResults.csv", row.names=FALSE)
# write.csv(slRatingTable, file="dataFiles/soilResults.csv", row.names=FALSE)
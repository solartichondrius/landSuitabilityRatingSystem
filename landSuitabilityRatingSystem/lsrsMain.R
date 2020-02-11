#INCOMPLETE
#January 24, 2020
#Hayden McAdam
#Read in and clean vector data and call functions to calculate points for
#climate, landscape, and soil factors.

#TODO: 
#Add soil data and functions into this file to be processed
#with the landscape and climate data.
#Implement raster data functionality.
#Correct column names to match the real data.
#Calculate the region value in the topography function 
#using slope length (Figure 6.1).

source("All.R")

#Data currently being used.
clTable <- read.csv("O:/Temporary/lsrs/test_data/ab_vector/climate1981x10_CCCS_baseline.csv")
lsTable <- read.csv("O:/Temporary/lsrs/test_data/ab_vector//landscapeTest2.csv")

#Real landscape vector data.
#lsTable <- read.dbf("../../ab_vector/CFR_slc32_250m.dbf")
#lsTable <- read.dbf("../../ab_vector/ab_rasterized_slc32_250m.dbf")

lsRatingTable <- landscapeRatingPoints(lsTable$slc, lsTable$region, lsTable$ps,
                       lsTable$lt, lsTable$cf,
                       lsTable$surface, lsTable$subsurface,
                       lsTable$pattern, lsTable$inundationPeriod,
                       lsTable$usableGrowingSeasonLength, lsTable$frequency)

lsRatingTable <- subset(lsRatingTable, points >= 0 & points <= 100)

lsRatingTable$class <- landscapeRatingClass(lsRatingTable$points,
                                            lsRatingTable$t, lsRatingTable$p,
                                            lsRatingTable$j, lsRatingTable$k,
                                            lsRatingTable$i)

lsRatingTable <- subset(lsRatingTable, select=-c(t, p, j, k, i))

clTable <- clTable[c("slc", "ppe", "egdd", "esm", "efm", "eff")]

clRatingTable <- climateRatingPoints(clTable$ppe, clTable$egdd, clTable$esm,
                                      clTable$efm, clTable$eff)

#clRatingTable <- subset(clRatingTable, points >= 0 & points <= 100)

clRatingTable$class <- climateRatingClass(clRatingTable$points,
                                          clRatingTable$moistureDeduction, 
                                          clRatingTable$temperatureDeduction)

# clRatingTable <- subset(clRatingTable, select=-c(moistureDeduction,
#                                  temperatureDeduction, basicClimateRating,
#                                  springMoisture, fallMoisture, fallFrost))

#Write the results into csv files.
write.csv(lsRatingTable, file= "dataFiles/testResults.csv", row.names=FALSE)
write.csv(clRatingTable, file= "dataFiles/climateResults.csv", row.names=FALSE)

#NOTE: I haven't seen any results from the web app that had any pattern value
#other than 0 or a flooding value other than 1. 
#I'm not sure if this variable is used in the calculations at all.
#The test code has these values set to 0 or 1 respectively 
#in all records for now.
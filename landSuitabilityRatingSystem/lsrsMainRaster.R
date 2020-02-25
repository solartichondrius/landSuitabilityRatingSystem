#Process all raster data for climate, landscape, and soil factors.
#This file is temporary and only being used for testing purposes.
#Ideally, raster and vector data would be processed in one file.

source("pointsToClass.R")
source("climaticFactors/climateRatingPoints.R")
source("climaticFactors/climateRatingClass.R")
source("climaticFactors/moistureFactor.R")
source("climaticFactors/temperatureFactor.R")
source("climaticFactors/excessSpringMoisture.R")
source("climaticFactors/excessFallMoisture.R")
source("climaticFactors/fallFrost.R")

#Climate raster data
clRaster=c("../../ab_raster/AB_EGDD_250m_lcc.tif",
           "../../ab_raster/AB_PPE_250m_lcc.tif")
clRasterTable <- stack(clRaster)
clTable <- as.data.frame(clRasterTable, na.rm=TRUE)
clTable <- unique(clTable)

#Landscape raster data.
#"../../ab_raster/ab_250m_ls_factor_lcc.tif"
lsRaster=c("../../ab_raster/ab_250m_slope_percent_lcc.tif",
           "../../ab_raster/ab_250m_slength_m_lcc.tif")
#Different extent
#lsRaster4 <- raster("../../ab_raster/ab_250m_cfrag15_lcc.tif")
lsRasterTable <- stack(lsRaster)
lsTableR <- as.data.frame(lsRasterTable, na.rm=TRUE)
lsTableR <- unique(lsTableR)

#Soil raster data
slRaster <- raster("../../ab_raster/PSM_SoilGreatGroup_250m.tif")
slRasterTable <- stack(slRaster)
slTableR <- as.data.frame(slRaster, na.rm=TRUE)

clRatingTable <- climateRatingPoints(clTable$AB_PPE_250m_lcc, clTable$AB_EGDD_250m_lcc,
                                      -50, 0, 0)
clRatingTable$class <- climateRatingClass(clRatingTable$points,
                                          clRatingTable$a, clRatingTable$h)
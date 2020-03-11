#Process all raster data for climate, landscape, and soil factors.
#This file is temporary and is only being used for testing purposes.

library(raster)

source("pointsToClass.R")
source("climaticFactors/climateRatingPoints.R")
source("climaticFactors/climateRatingClass.R")
source("climaticFactors/moistureFactor.R")
source("climaticFactors/temperatureFactor.R")
source("climaticFactors/excessSpringMoisture.R")
source("climaticFactors/excessFallMoisture.R")
source("climaticFactors/fallFrost.R")
source("soilFactors/soilRatingPoints.R")
source("soilFactors/capacity.R")

#Climate raster data
# clRaster=c("../../ab_raster/AB_PPE_250m_lcc.tif",
#            "../../ab_raster/AB_EGDD_250m_lcc.tif", 
#            "../../ab_raster/ab_250m_climate_esm_lcc.tif",
#            "../../ab_raster/ab_250m_climate_fsm_lcc.tif")
# clRasterTable <- stack(clRaster)
# clTable <- as.data.frame(clRasterTable, na.rm=TRUE)
# colnames(clTable) <- c("ppe", "egdd", "esm", "efm")
# clTable <- unique(clTable)

#Landscape raster data.
# lsRaster=c("../../ab_raster/ab_250m_slope_percent_lcc.tif",
#            "../../ab_raster/ab_250m_slength_m_lcc.tif",
#            "../../ab_raster/ab_250m_ls_factor_lcc.tif")
#Different extent
#lsRaster4 <- raster("../../ab_raster/ab_250m_cfrag15_lcc.tif")
# lsRasterTable <- stack(lsRaster)
# lsTable <- as.data.frame(lsRasterTable, na.rm=TRUE)
# lsTable <- unique(lsTable)

#Soil raster data
slRaster=c("../../ab_raster/soilData/alberta_CLYPPT_M_sl1_250m_lcc.tif", 
           "../../ab_raster/soilData/alberta_CLYPPT_M_sl2_250m_lcc.tif", 
           "../../ab_raster/soilData/alberta_CLYPPT_M_sl3_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_CLYPPT_M_sl4_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_CLYPPT_M_sl5_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_CLYPPT_M_sl6_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_CLYPPT_M_sl7_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_SLTPPT_M_sl1_250m_lcc.tif", 
           "../../ab_raster/soilData/alberta_SLTPPT_M_sl2_250m_lcc.tif", 
           "../../ab_raster/soilData/alberta_SLTPPT_M_sl3_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_SLTPPT_M_sl4_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_SLTPPT_M_sl5_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_SLTPPT_M_sl6_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_SLTPPT_M_sl7_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_SNDPPT_M_sl1_250m_lcc.tif", 
           "../../ab_raster/soilData/alberta_SNDPPT_M_sl2_250m_lcc.tif", 
           "../../ab_raster/soilData/alberta_SNDPPT_M_sl3_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_SNDPPT_M_sl4_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_SNDPPT_M_sl5_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_SNDPPT_M_sl6_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_SNDPPT_M_sl7_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_CRFVOL_M_sl1_250m_lcc.tif", 
           "../../ab_raster/soilData/alberta_CRFVOL_M_sl2_250m_lcc.tif", 
           "../../ab_raster/soilData/alberta_CRFVOL_M_sl3_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_CRFVOL_M_sl4_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_CRFVOL_M_sl5_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_CRFVOL_M_sl6_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_CRFVOL_M_sl7_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_PHIHOX_M_sl1_250m_lcc.tif", 
           "../../ab_raster/soilData/alberta_PHIHOX_M_sl2_250m_lcc.tif", 
           "../../ab_raster/soilData/alberta_PHIHOX_M_sl3_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_PHIHOX_M_sl4_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_PHIHOX_M_sl5_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_PHIHOX_M_sl6_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_PHIHOX_M_sl7_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_PHIKCL_M_sl1_250m_lcc.tif", 
           "../../ab_raster/soilData/alberta_PHIKCL_M_sl2_250m_lcc.tif", 
           "../../ab_raster/soilData/alberta_PHIKCL_M_sl3_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_PHIKCL_M_sl4_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_PHIKCL_M_sl5_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_PHIKCL_M_sl6_250m_lcc.tif",
           "../../ab_raster/soilData/alberta_PHIKCL_M_sl7_250m_lcc.tif")
#Different extent
#"../../ab_raster/soilData/PSM_SoilGreatGroup_250m.tif",
slRasterTable <- stack(slRaster)
slTable <- as.data.frame(slRasterTable, na.rm=TRUE)
#slTable <- unique(slTable)

slTable$claySurface <- rowMeans(slTable[,c("alberta_CLYPPT_M_sl1_250m_lcc",
                                           "alberta_CLYPPT_M_sl2_250m_lcc",
                                           "alberta_CLYPPT_M_sl3_250m_lcc")])
slTable$claySubsurface <- rowMeans(slTable[,c("alberta_CLYPPT_M_sl4_250m_lcc",
                                              "alberta_CLYPPT_M_sl5_250m_lcc",
                                              "alberta_CLYPPT_M_sl6_250m_lcc",
                                              "alberta_CLYPPT_M_sl7_250m_lcc")])
slTable$sandSurface <- rowMeans(slTable[,c("alberta_SNDPPT_M_sl1_250m_lcc",
                                           "alberta_SNDPPT_M_sl2_250m_lcc",
                                           "alberta_SNDPPT_M_sl3_250m_lcc")])
slTable$sandSubsurface <- rowMeans(slTable[,c("alberta_SNDPPT_M_sl4_250m_lcc",
                                              "alberta_SNDPPT_M_sl5_250m_lcc",
                                              "alberta_SNDPPT_M_sl6_250m_lcc",
                                              "alberta_SNDPPT_M_sl7_250m_lcc")])
slTable$siltSurface <- rowMeans(slTable[,c("alberta_SLTPPT_M_sl1_250m_lcc",
                                           "alberta_SLTPPT_M_sl2_250m_lcc",
                                           "alberta_SLTPPT_M_sl3_250m_lcc")])
slTable$siltSubsurface <- rowMeans(slTable[,c("alberta_SLTPPT_M_sl4_250m_lcc",
                                              "alberta_SLTPPT_M_sl5_250m_lcc",
                                              "alberta_SLTPPT_M_sl6_250m_lcc",
                                              "alberta_SLTPPT_M_sl7_250m_lcc")])
slTable$cfSurface <- rowMeans(slTable[,c("alberta_CRFVOL_M_sl1_250m_lcc",
                                           "alberta_CRFVOL_M_sl2_250m_lcc",
                                           "alberta_CRFVOL_M_sl3_250m_lcc")])
slTable$cfSubsurface <- rowMeans(slTable[,c("alberta_CRFVOL_M_sl4_250m_lcc",
                                              "alberta_CRFVOL_M_sl5_250m_lcc",
                                              "alberta_CRFVOL_M_sl6_250m_lcc",
                                              "alberta_CRFVOL_M_sl7_250m_lcc")])

# slRatingTableM <- soilRatingPoints(slTable$claySurface, slTable$claySubsurface,
#                                    slTable$sandSurface, slTable$sandSubsurface,
#                                    slTable$siltSurface, slTable$siltSubsurface,
#                                    0, 0, 0, 0, 0, 0, 0, 0, 0)

#Climate calculations
clRatingTable <- climateRatingPoints(clTable$ppe, clTable$egdd,
                                     clTable$esm, clTable$efm, 0)
clRatingTable$class <- climateRatingClass(clRatingTable$points,
                                          clRatingTable$a, clRatingTable$h)
# Title     : Climate Raster
# Objective : Load Raster files for Climate data into a single dataframe
# Created by: CurtisTh
# Created on: 2020-02-04

climateRaster <- function(PPERaster, springPPERaster, fallPPERaster, EGDDRaster, DBAFFRaster){

  PPE <- loadRaster(PPERaster)
  springPPE <- loadRaster(springPPERaster)
  fallPPE <- loadRaster(fallPPERaster)
  EGDD <- loadRaster(EGDDRaster)
  DBAFF <- loadRaster(DBAFFRaster)

  df <- cbind(PPE,springPPE,fallPPE,EGDD,DBAFF)
  names(df)[1] <- "ppe"
  names(df)[2] <- "esm"
  names(df)[3] <- "efm"
  names(df)[4] <- "egdd"
  names(df)[5] <- "eff"
  df$rowNumber <- 1:nrow(df)

  return(df)
}

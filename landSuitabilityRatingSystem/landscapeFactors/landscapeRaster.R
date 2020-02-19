# Title     : Lanscape Raster
# Objective : Load Raster file for Landscape data into a single dataframe
# Created by: CurtisTh
# Created on: 2020-02-07

landscapeRaster <- function(regionR, percentSlopeR, landscapeTypeR, coarseFragmentsR, surfaceR, subsurfaceR, patternR, inundationPeriodR, usableGrowingSeasonLengthR, frequencyR){

  region <- loadRaster(regionR)
  percentSlope <- loadRaster(percentSlopeR)
  landscapeType <- loadRaster(landscapeTypeR)
  coarseFragments <- loadRaster(coarseFragmentsR)
  surface <- loadRaster(surfaceR)
  subsurface <- loadRaster(subsurfaceR)
  pattern <- loadRaster(patternR)
  inundationPeriod <- loadRaster(inundationPeriodR)
  usableGrowingSeasonLength <- loadRaster(usableGrowingSeasonLengthR)
  frequency <- loadRaster(frequencyR)

  df <- cbind(region, percentSlope, landscapeType, coarseFragments, surface, subsurface, pattern, inundationPeriod, usableGrowingSeasonLength, frequency)
  names(df)[1] <- "region"
  names(df)[2] <- "percentSlope"
  names(df)[3] <- "landscapeType"
  names(df)[4] <- "coarseFragments"
  names(df)[5] <- "surface"
  names(df)[6] <- "subsurface"
  names(df)[7] <- "pattern"
  names(df)[8] <- "inundationPeriod"
  names(df)[9] <- "usableGrowingSeasonLength"
  names(df)[10] <- "frequency"
  df$rowNumber <- 1:nrow(df)

  return(df)
}
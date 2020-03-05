# Title     : Landscape Rating
# Objective : Perform all the calculations for the Landscape Rating
# Created by: CurtisTh
# Created on: 2020-01-31

landscapeRating <- function(region, percentSlope, landscapeType, coarseFragments, surface, subsurface, pattern, inundationPeriod, usableGrowingSeasonLength, frequency) {

  #if(is.na(region)|is.na(percentSlope)|is.na(landscapeType)|is.na(coarseFragments)|is.na(surface)|is.na(subsurface)|is.na(pattern)|is.na(inundationPeriod)|is.na(usableGrowingSeasonLength)|is.na(frequency)){
  #  return(c(NA,NA)) # If any of the values are null then return null for all the results since we can't perform any calculations on null values
  #}

  t <- topography(region, percentSlope, landscapeType)
  a <- 100 - t
  P <- (stoniness(coarseFragments) / 100) * a
  J <- woodContent(surface, subsurface)
  b <- (P + J)
  c <- a - b
  K <- pattern
  I <- flooding(inundationPeriod, usableGrowingSeasonLength, frequency)
  d <- K + I
  finalLandscapeRating <- c - d

  class <- pointsToClass(finalLandscapeRating)

  if (t>=15){class <- paste0(class, "T")}
  if (P>=15){class <- paste0(class, "P")}
  if (J>=15){class <- paste0(class, "J")}
  if (K>=15){class <- paste0(class, "K")}
  if (I>=15){class <- paste0(class, "I")}

  return(c(finalLandscapeRating,class))
}
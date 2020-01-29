# Title     : Landscape Rating
# Objective : Calculate the landscape rating
# Created by: CurtisTh
# Created on: 2020-01-21

source("landscapeFactors/topography.R")
source("landscapeFactors/stoniness.R")
source("landscapeFactors/woodContent.R")
source("landscapeFactors/flooding.R")

landscapeRatingPoints <- function(region, ps, lt, s, cf,
                                  surface, subsurface, pattern, 
                                  inundationPeriod, usableGrowingSeasonLength, 
                                  frequency) {
  
  T <- tRating(region, ps, lt)
  a <- 100 - T
  P <- (pRating(s, cf) / 100) * a
  J <- woodContent(surface, subsurface)
  b <- (P + J)
  c <- a - b
  K <- pattern
  I <- flooding(inundationPeriod, usableGrowingSeasonLength, frequency)
  d <- K + I
  L <- c - d
  
  return(L)
}
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
  T <- 100 - tRating(region,ps,lt)
  P <- pRating(s, cf)
  J <- woodContent(surface, subsurface)
  a <- (P + J) / 100
  b <- T * a
  c <- T - b
  K <- pattern / 100
  I <- flooding(inundationPeriod, usableGrowingSeasonLength, frequency) / 100
  d <- (K+I)*c
  L <- a - b - d
  #return(c(L,P,J,K,I))
  return(L)
}
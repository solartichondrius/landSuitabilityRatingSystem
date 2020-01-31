# Title     : Landscape Rating
# Objective : Calculate the landscape rating
# Created by: CurtisTh
# Created on: 2020-01-21

landscapeRatingPoints <- function(region, ps, lt, s, cf,
                                  surface, subsurface, pattern, 
                                  inundationPeriod, usableGrowingSeasonLength, 
                                  frequency) {
  loadFiles("landscapeFactors/topography.R","landscapeFactors/stoniness.R","landscapeFactors/woodContent.R","landscapeFactors/flooding.R")

  T <- tRating(region, ps, lt)
  a <- 100 - T
  P <- (pRating(s, cf) / 100) * T
  J <- woodContent(surface, subsurface)
  b <- (P + J)
  c <- a - b
  K <- pattern
  I <- flooding(inundationPeriod, usableGrowingSeasonLength, frequency)
  d <- K + I
  L <- c - d
  # T <- 100 - tRating(region,ps,lt)
  # P <- pRating(s, cf)
  # J <- woodContent(surface, subsurface)
  # a <- (P + J) / 100
  # b <- T * a
  # c <- T - b
  # K <- pattern / 100
  # I <- flooding(inundationPeriod, usableGrowingSeasonLength, frequency) / 100
  # d <- (K+I)*c
  # L <- (a - b - d) + 100
  #return(c(L,P,J,K,I))
  return(L)
}
# Title     : Landscape Rating
# Objective : Calculate the landscape rating
# Created by: CurtisTh
# Created on: 2020-01-21

source("landscapeFactors/topography.R")
source("landscapeFactors/stoniness.R")
source("landscapeFactors/woodContent.R")
source("landscapeFactors/flooding.R")

landscapeRatingPoints <- function(region, ps, lt, cf,
                                  surface, subsurface, pattern, 
                                  inundationPeriod, usableGrowingSeasonLength, 
                                  frequency) {
  t <- tRating(region, ps, lt)
  a <- 100 - t
  P <- (pRating(cf) / 100) * a
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
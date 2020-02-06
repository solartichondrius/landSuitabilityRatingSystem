# Title     : Landscape Rating
# Objective : Calculate the landscape rating
# Created by: CurtisTh
# Created on: 2020-01-21

landscapeRatingPoints <- function(slc, region, ps, lt, cf,
                                  surface, subsurface, pattern, 
                                  inundationPeriod, usableGrowingSeasonLength, 
                                  frequency) {

  t <- topography(region, ps, lt)
  a <- 100 - t
  P <- (stoniness(cf) / 100) * a
  J <- woodContent(surface, subsurface)
  b <- (P + J)
  c <- a - b
  K <- pattern
  I <- flooding(inundationPeriod, usableGrowingSeasonLength, frequency)
  d <- K + I
  L <- c - d

  lsRatingTable <- lsTable
  lsRatingTable$t <- t
  lsRatingTable$p <- P
  lsRatingTable$j <- J
  lsRatingTable$k <- K
  lsRatingTable$i <- I
  lsRatingTable$points <- L

  return(lsRatingTable)
}
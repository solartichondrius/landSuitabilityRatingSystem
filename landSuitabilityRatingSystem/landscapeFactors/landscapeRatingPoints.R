# Title     : Landscape Rating
# Objective : Calculate the landscape rating
# Created by: CurtisTh
# Created on: 2020-01-21

landscapeRatingPoints <- function(slc, region, ps, lt, cf,
                                  surface, subsurface, pattern, 
                                  inundationPeriod, usableGrowingSeasonLength, 
                                  frequency) {

  lsRatingTable <- lsTable
  
  t <- tRating(region, ps, lt)
  lsRatingTable$t <- t
  lsRatingTable$t <- with(slRatingTable, replace(t, t < 0, 0))
  lsRatingTable$t <- with(slRatingTable, replace(t, t > 100, 100))
  a <- 100 - t
  
  P <- (pRating(cf) / 100) * a
  lsRatingTable$p <- P
  lsRatingTable$p <- with(slRatingTable, replace(p, p < 0, 0))
  lsRatingTable$p <- with(slRatingTable, replace(p, p > 100, 100))
  
  J <- woodContent(surface, subsurface)
  lsRatingTable$j <- J
  lsRatingTable$j <- with(slRatingTable, replace(j, j < 0, 0))
  lsRatingTable$j <- with(slRatingTable, replace(j, j > 25, 25))
  
  b <- (P + J)
  c <- a - b
  K <- pattern
  lsRatingTable$k <- K
  I <- flooding(inundationPeriod, usableGrowingSeasonLength, frequency)
  lsRatingTable$i <- I
  d <- K + I
  L <- c - d
  lsRatingTable$points <- L
  
  return(lsRatingTable)
}
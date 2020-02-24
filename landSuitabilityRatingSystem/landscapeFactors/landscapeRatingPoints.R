# Title     : Landscape Rating
# Objective : Calculate the point deduction for the landscape factor.
# Created by: CurtisTh
# Created on: 2020-01-21

landscapeRatingPoints <- function(region, ps, lt, cf,
                                  surface, subsurface, pattern, 
                                  inundationPeriod, usableGrowingSeasonLength, 
                                  frequency) {

  #Calculate point deduction from topography/slope and 
  #subtract it from 100 to find the basic landscape rating (a).
  t <- topography(region, ps, lt)
  a <- 100 - t
  #Calculate point deduction from coarse fragments as a percentage of a.
  P <- (stoniness(cf) / 100) * a
  #Calculate point deduction from wood content (currently unused).
  J <- woodContent(surface, subsurface)
  #Add the coarse fragment and wood content deductions together to find
  #the large fragments deduction (b).
  b <- (P + J)
  #Subtract b from a to find the interim landscape rating (c).
  c <- a - b
  #Calculate the landscape pattern and flooding deductions 
  #(like wood content, these are currently unused).
  K <- pattern
  I <- flooding(inundationPeriod, usableGrowingSeasonLength, frequency)
  d <- K + I
  #Subtract the pattern and flooding deductions from c to calculate the
  #final landscape point value.
  L <- c - d
  #Create a new table containing all columns from lsTable and new columns
  #for the values involved in deduction calculations, which will be used
  #to find the class.
  lsRatingTable <- lsTable
  lsRatingTable$t <- t
  lsRatingTable$p <- P
  lsRatingTable$j <- J
  lsRatingTable$k <- K
  lsRatingTable$i <- I
  lsRatingTable$points <- L
  return(lsRatingTable)
}
# Title     : Landscape Rating
# Objective : Calculate the point deduction for the landscape factor.
# Created by: CurtisTh
# Created on: 2020-01-21

landscapeRatingPoints <- function(cropType, region, ps, lt, cf,
                                  surface, subsurface, pattern,
                                  inundationPeriod, usableGrowingSeasonLength,
                                  frequency, printProgress=FALSE) {

  #Calculate point deduction from topography/slope and
  #subtract it from 100 to find the basic landscape rating (a).
  if(printProgress) incProgress(0.1, detail = ("calculating topography deduction")) #print the progress to the website
  t <- topography(cropType, region, ps, lt)
  a <- 100 - t
  #Calculate point deduction from coarse fragments as a percentage of a.
  if(printProgress) incProgress(0.1, detail = ("calculating stoniness deduction")) #print the progress to the website
  P <- (stoniness(cropType, cf) / 100) * a
  #Calculate point deduction from wood content (currently unused).
  if(printProgress) incProgress(0.1, detail = ("calculating wood content deduction")) #print the progress to the website
  J <- woodContent(cropType, surface, subsurface)
  #Add the coarse fragment and wood content deductions together to find
  #the large fragments deduction (b).
  b <- (P + J)
  #Subtract b from a to find the interim landscape rating (c).
  c <- a - b
  #Calculate the landscape pattern and flooding deductions
  #(like wood content, these are currently unused).
  K <- pattern
  if(printProgress) incProgress(0.1, detail = ("calculating flooding deduction")) #print the progress to the website
  I <- flooding(cropType, inundationPeriod, usableGrowingSeasonLength, frequency)
  d <- K + I
  #Subtract the pattern and flooding deductions from c to calculate the
  #final landscape point value.
  if(printProgress) incProgress(0.1, detail = ("calculating final landscape points")) #print the progress to the website
  L <- c - d

  return(c(L,t,P,J,K,I))
}
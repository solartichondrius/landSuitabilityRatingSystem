# Title     : Landscape Rating
# Objective : Calculate the landscape rating
# Created by: CurtisTh
# Created on: 2020-01-21

landscapeRatingPoints <- function(region,percentSlope,landscapeType,annualRemoval,coarseFragments,woodContent,pattern,flooding){
  T <- 100 - slope(percentSlope,region,landscapeType)
  P <- stoniness(annualRemoval)
  p <- coarseFragmentContent(coarseFragments)
  J <- woodContent(woodContent)
  a <- (P + p + J) / 100
  b <- T * a
  c <- T - b
  #need to find the interim soil rating before the next step can be done
}
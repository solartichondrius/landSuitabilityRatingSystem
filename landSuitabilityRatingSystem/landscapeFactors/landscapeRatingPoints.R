# Title     : Landscape Rating
# Objective : Calculate the landscape rating
# Created by: CurtisTh
# Created on: 2020-01-21

landscapeRatingPoints <- function(stoniness,coarseFragments,woodContent,pattern,flooding){

  A <- 100 - moistureFactor(PPE)
  H <- 100 - temperatureFactor(EGDD)

  #basic climatic rating (BCR) is the lower of A or H
  if(A < H){ #so if A is smaller than H
    basicClimateRating <- A #then the BCR is equal to a
  } else { #or else if A is equal to or greater than H
    basicClimateRating <- H #then the BCR is equal to H
  }

  springMoisture <- excessSpringMoisture(springPPE)/100 #get the spring moisture percent deduction as a decimal
  fallMoisture <- excessFallMoisture(fallPPE)/100 #get the fall moisture percent deduction as a decimal
  fallFrost <- fallFrost(DBAFF)/100 #get the fall frost percent deduction as a decimal

  modificationDeduction <- (springMoisture + fallMoisture + fallFrost) * basicClimateRating
  finalClimateRating <- basicClimateRating - modificationDeduction

  return(c(finalClimateRating,A,H)) #return the final climate rating and the moisture and temperature factor deductions
}
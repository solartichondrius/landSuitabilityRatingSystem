# Title     : Climate Rating
# Objective : Calculate the climate rating
# Created by: CurtisTh
# Created on: 2020-01-20

climateRatingPoints <- function(PPE, EGDD, springPPE, fallPPE, DBAFF){

  #Load the files with the functions we will be using:
  loadFiles("climaticFactors/moistureFactor.R","climaticFactors/temperatureFactor.R","climaticFactors/excessFallMoisture.R","climaticFactors/excessSpringMoisture.R","climaticFactors/fallFrost.R")

  moistureDeduction <- moistureFactor(PPE)
  temperatureDeduction <- temperatureFactor(EGDD)
  A <- 100 - moistureDeduction
  H <- 100 - temperatureDeduction

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

  return(c(finalClimateRating,moistureDeduction,temperatureDeduction)) #return the final climate rating and the moisture and temperature factor deductions
  #return(finalClimateRating)
}
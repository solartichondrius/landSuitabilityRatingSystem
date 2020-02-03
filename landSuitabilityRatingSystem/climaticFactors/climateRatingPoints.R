# Title     : Climate Rating
# Objective : Calculate the climate rating
# Created by: CurtisTh
# Created on: 2020-01-20

source("climaticFactors/moistureFactor.R")
source("climaticFactors/temperatureFactor.R")
source("climaticFactors/excessSpringMoisture.R")
source("climaticFactors/excessFallMoisture.R")
source("climaticFactors/fallFrost.R")

climateRatingPoints <- function(PPE, EGDD, springPPE, fallPPE, DBAFF){

  moistureDeduction <- moistureFactor(PPE)
  temperatureDeduction <- temperatureFactor(EGDD)
  A <- 100 - moistureDeduction
  H <- 100 - temperatureDeduction

  #basic climatic rating (BCR) is the lower of A or H
  ifelse(A < H, basicClimateRating <- A, basicClimateRating <- H)

  springMoisture <- excessSpringMoisture(springPPE)/100 #get the spring moisture percent deduction as a decimal
  fallMoisture <- excessFallMoisture(fallPPE)/100 #get the fall moisture percent deduction as a decimal
  fallFrost <- fallFrost(DBAFF)/100 #get the fall frost percent deduction as a decimal

  modificationDeduction <- (springMoisture + fallMoisture + fallFrost) * basicClimateRating
  finalClimateRating <- basicClimateRating - modificationDeduction

  return(finalClimateRating)
}
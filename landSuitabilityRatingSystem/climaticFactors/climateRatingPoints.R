# Title     : Climate Rating Points
# Objective : Calculate the point deductions for the climate factor.
# Created by: CurtisTh
# Created on: 2020-01-20

climateRatingPoints <- function(PPE, springPPE, fallPPE, EGDD, DBAFF){

  moistureDeduction <- moistureFactor(PPE) #calculate moisture deduction
  temperatureDeduction <- temperatureFactor(EGDD) #calculate temperature deduction
  A <- 100 - moistureDeduction #subtract the moisture deduction from 100 to get A
  H <- 100 - temperatureDeduction #subtract the temperature deduction from 100 to get H

  basicClimateRating <- min(A,H) #basic climatic rating (BCR) is the lower of A or H

  springMoisture <- excessSpringMoisture(springPPE) #calculate spring moisture percent deduction
  fallMoisture <- excessFallMoisture(fallPPE) #calculate fall moisture percent deduction
  fallFrost <- fallFrost(DBAFF) #calculate fall frost percent deduction

  #add upp all of the percent deductions (springMoisture, fallMoisture, and fallFrost) then divide by 100 to get the percentage as a decimal,
  #then multiply that decimal by the basic climate rating to get the modification deduction
  modificationDeduction <- (springMoisture + fallMoisture + fallFrost)/100 * basicClimateRating
  #the final climate rating is the basic climate rating minus the modification deduction
  finalClimateRating <- basicClimateRating - modificationDeduction

  return(c(finalClimateRating,moistureDeduction,temperatureDeduction))
}
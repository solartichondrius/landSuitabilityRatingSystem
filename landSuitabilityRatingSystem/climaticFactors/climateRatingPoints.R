# Title     : Climate Rating Points
# Objective : Calculate the point deductions for the climate factor.
# Created by: CurtisTh
# Created on: 2020-01-20

climateRatingPoints <- function(cropType, PPE, springPPE, fallPPE, EGDD, DBAFF, printProgress=FALSE){

  if(printProgress) incProgress(0.1, detail = ("calculating moisture deduction")) #print the progress to the website
  moistureDeduction <- moistureFactor(cropType, PPE) #calculate moisture deduction
  if(printProgress) incProgress(0.1, detail = ("calculating temperature deduction")) #print the progress to the website
  temperatureDeduction <- temperatureFactor(cropType, EGDD) #calculate temperature deduction
  A <- 100 - moistureDeduction #subtract the moisture deduction from 100 to get A
  H <- 100 - temperatureDeduction #subtract the temperature deduction from 100 to get H
  if(printProgress) incProgress(0.1, detail = ("calculating basic climate rating")) #print the progress to the website
  basicClimateRating <- min(A,H) #basic climatic rating (BCR) is the lower of A or H
  if(printProgress) incProgress(0.1, detail = ("calculating spring moisture deduction")) #print the progress to the website
  springMoisture <- excessSpringMoisture(cropType, springPPE) #calculate spring moisture percent deduction
  if(printProgress) incProgress(0.1, detail = ("calculating fall moisture deduction")) #print the progress to the website
  fallMoisture <- excessFallMoisture(cropType, fallPPE) #calculate fall moisture percent deduction
  if(printProgress) incProgress(0.1, detail = ("calculating fall frost deduction")) #print the progress to the website
  fallFrost <- fallFrost(cropType, DBAFF) #calculate fall frost percent deduction

  #add upp all of the percent deductions (springMoisture, fallMoisture, and fallFrost) then divide by 100 to get the percentage as a decimal,
  #then multiply that decimal by the basic climate rating to get the modification deduction
  if(printProgress) incProgress(0.1, detail = ("calculating modification deduction")) #print the progress to the website
  modificationDeduction <- (springMoisture + fallMoisture + fallFrost)/100 * basicClimateRating
  #the final climate rating is the basic climate rating minus the modification deduction
  if(printProgress) incProgress(0.1, detail = ("calculating final climate rating")) #print the progress to the website
  finalClimateRating <- basicClimateRating - modificationDeduction

  return(c(finalClimateRating,moistureDeduction,temperatureDeduction))
}
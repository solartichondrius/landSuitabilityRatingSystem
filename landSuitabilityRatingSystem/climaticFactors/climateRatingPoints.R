# Title     : Climate Rating Points
# Objective : Calculate the point deductions for the climate factor.
# Created by: CurtisTh
# Created on: 2020-01-20

climateRatingPoints <- function(cropType, PPE, springPPE, fallPPE, EGDD, DBAFF, printProgress=FALSE){

  #Print the progress to the website.
  if(printProgress) incProgress(0.1, detail = ("calculating moisture deduction"))
  #Calculate moisture and temperature deductions using P-PE and EGDD.
  moistureDeduction <- climateMoisture(cropType, PPE)
  if(printProgress) incProgress(0.1, detail = ("calculating temperature deduction"))
  temperatureDeduction <- temperatureFactor(cropType, EGDD)
  
  #Calculate the point values after the moisture and temperature deductions.
  A <- 100 - moistureDeduction
  H <- 100 - temperatureDeduction
  
  #The basic climatic rating (BCR) is the lower value of A and H.
  if(printProgress) incProgress(0.1, detail = ("calculating basic climate rating"))
  basicClimateRating <- min(A,H) 
  
  #Calculate deductions for modifying factors.
  if(printProgress) incProgress(0.1, detail = ("calculating spring moisture deduction"))
  springMoisture <- excessSpringMoisture(cropType, springPPE) #calculate spring moisture percent deduction
  if(printProgress) incProgress(0.1, detail = ("calculating fall moisture deduction"))
  fallMoisture <- excessFallMoisture(cropType, fallPPE) #calculate fall moisture percent deduction
  if(printProgress) incProgress(0.1, detail = ("calculating fall frost deduction"))
  fallFrost <- fallFrost(cropType, DBAFF) #calculate fall frost percent deduction
  
  #Calculate the total modification deduction as a percentage of the BCR 
  #and subtract it from the BCR to get the final point value.
  if(printProgress) incProgress(0.1, detail = ("calculating modification deduction")) #print the progress to the website
  modificationDeduction <- (springMoisture + fallMoisture + fallFrost)/100 * basicClimateRating
  if(printProgress) incProgress(0.1, detail = ("calculating final climate rating")) #print the progress to the website
  finalClimateRating <- basicClimateRating - modificationDeduction

  return(c(finalClimateRating,moistureDeduction,temperatureDeduction))
}
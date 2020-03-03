# Title     : Climate Rating Points
# Objective : Calculate the point deductions for the climate factor.
# Created by: CurtisTh
# Created on: 2020-01-20

climateRatingPoints <- function(PPE, EGDD, springPPE, fallPPE, DBAFF){

  #Calculate moisture and temperature deductions using PPE and EGDD.
  moistureDeduction <- moistureFactor(PPE)
  temperatureDeduction <- temperatureFactor(EGDD)
  
  #Create a new table containing all columns from clTable and new columns
  #for the values involved in deduction calculations, which will be used
  #to find the class.
  clRatingTable <- clTable
  clRatingTable$a <- moistureDeduction
  clRatingTable$h <- temperatureDeduction
  
  #Calculate the point values after the moisture and temperature deductions.
  A <- 100 - moistureDeduction
  H <- 100 - temperatureDeduction
  
  #The basic climate rating (BCR) is the lower value of A and H.
  basicClimateRating <- ifelse(A < H, A, H)
  clRatingTable$basicClimateRating <- basicClimateRating

  #Calculate deductions for modifying factors.
  springMoisture <- excessSpringMoisture(springPPE)
  fallMoisture <- excessFallMoisture(fallPPE)
  #The data for fall frost is currently unavailable.
  fallFrost <- fallFrost(DBAFF)
  clRatingTable$springMoisture <- springMoisture
  clRatingTable$fallMoisture <- fallMoisture
  clRatingTable$fallFrost <- fallFrost
  
  #Calculate the total modification deduction as a percentage of the BCR 
  #and subtract it from the BCR to get the final point value.
  modificationDeduction <- ((springMoisture + fallMoisture + fallFrost) / 100) * basicClimateRating
  finalClimateRating <- basicClimateRating - modificationDeduction
  clRatingTable$points <- finalClimateRating
  return(clRatingTable)
}
# Title     : Climate Rating
# Objective : Calculate the climate rating
# Created by: CurtisTh
# Created on: 2020-01-20

climateRatingPoints <- function(PPE, EGDD, springPPE, fallPPE, DBAFF){

  moistureDeduction <- moistureFactor(PPE)
  temperatureDeduction <- temperatureFactor(EGDD)
  
  #Create new table containing all columns from clTable and new columns
  #for the values involved in deduction calculations.
  clRatingTable <- clTable
  clRatingTable$moistureDeduction <- moistureDeduction
  clRatingTable$temperatureDeduction <- temperatureDeduction
  
  #Replace all negative values in the moisture and temperature deduction 
  #columns with 0.
  clRatingTable$moistureDeduction <- with(clRatingTable, 
                replace(moistureDeduction, moistureDeduction < 0, 0))
  clRatingTable$temperatureDeduction <- with(clRatingTable, 
                replace(temperatureDeduction, temperatureDeduction < 0, 0))
  
  A <- 100 - moistureDeduction
  H <- 100 - temperatureDeduction
  
  #basic climatic rating (BCR) is the lower of A or H
  basicClimateRating <- ifelse(A < H, A, H)
  
  clRatingTable$basicClimateRating <- basicClimateRating

  springMoisture <- excessSpringMoisture(springPPE)
  fallMoisture <- excessFallMoisture(fallPPE)
  fallFrost <- fallFrost(DBAFF)

  clRatingTable$springMoisture <- springMoisture
  clRatingTable$fallMoisture <- fallMoisture
  clRatingTable$fallFrost <- fallFrost
  
  #Replace all negative values in the modifying factor columns with 0.
  clRatingTable$springMoisture <- with(clRatingTable, 
                            replace(springMoisture, springMoisture < 0, 0))
  clRatingTable$springMoisture <- with(clRatingTable, 
                            replace(springMoisture, springMoisture > 10, 10))
  clRatingTable$fallMoisture <- with(clRatingTable, 
                            replace(fallMoisture, fallMoisture < 0, 0))
  clRatingTable$fallMoisture <- with(clRatingTable, 
                            replace(fallMoisture, fallMoisture > 10, 10))
  clRatingTable$fallFrost <- with(clRatingTable, 
                            replace(fallFrost, fallFrost < 0, 10))
  clRatingTable$fallFrost <- with(clRatingTable, 
                            replace(fallFrost, fallFrost > 10, 10))
  
  #Add the new modifying factors from the table rows together then convert 
  #them to decimal and multiply them by the basicClimateRating to get the
  #modification deduction.
  modificationDeduction <- modificationFactor(clRatingTable$springMoisture, 
                                            clRatingTable$fallMoisture, 
                                            clRatingTable$fallFrost, 
                                            clRatingTable$basicClimateRating)
  finalClimateRating <- basicClimateRating - modificationDeduction

  clRatingTable$points <- finalClimateRating
  
  return(clRatingTable)
}
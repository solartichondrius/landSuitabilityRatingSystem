# Title     : Climate Rating
# Objective : Perform all the calculations for the Climate Rating
# Created by: CurtisTh
# Created on: 2020-01-31

climateRating <- function(PPE, springPPE, fallPPE, EGDD, DBAFF){

  if(is.na(PPE)|is.na(springPPE)|is.na(fallPPE)|is.na(EGDD)|is.na(DBAFF)){
    return(c(NA,NA)) #BATMAN! If any of the values are null then return null for all the results since we can't perform any calculations on null values
  }

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

  springMoisture <- excessSpringMoisture(springPPE)
  fallMoisture <- excessFallMoisture(fallPPE)
  fallFrost <- fallFrost(DBAFF)

  modificationDeduction <- (springMoisture + fallMoisture + fallFrost)/100 * basicClimateRating
  finalClimateRating <- basicClimateRating - modificationDeduction

  class <- pointsToClass(finalClimateRating)
  if(moistureDeduction >= 15) class <- paste0(class,"A") #if the deduction points for the moisture factor (A) is 15 or greater add "A" as a subclass
  if(temperatureDeduction >= 15) class <- paste0(class,"H") #if the deduction points for the temperature factor (H) is 15 or greater add "H" as a subclass

  return(c(finalClimateRating,class))
}
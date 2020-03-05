# Title     : Temperature Factor (H)
# Objective : Calculate the point deduction for the Temperature Factor (H)
# Created by: CurtisTh
# Created on: 2020-01-20

temperatureFactor <- function(EGDD){
  pointDeduction <- EGDD #load all of the values from the given EGDD values into "pointDeduction"
  #all values less than 900 are multiplied by -0.05 and increased by 115:
  pointDeduction[pointDeduction<900] <- pointDeduction[pointDeduction<900]*-0.05+115
  #all values equal to or more than 900 are multiplied by -0.1 and increased by 160:
  pointDeduction[pointDeduction>=900] <- pointDeduction[pointDeduction>=900]*-0.10+160
  pointDeduction[pointDeduction<0] <- 0 #all values less than 0 become 0
  pointDeduction[pointDeduction>100] <- 100 #all values greater than 100 become 100
  return(pointDeduction)
}
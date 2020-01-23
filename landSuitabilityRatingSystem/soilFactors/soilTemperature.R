# Title     : Soil Temperature
# Objective : Calculate the point deductions based on soil temperature
# Created by: CurtisTh
# Created on: 2020-01-22

soilTemperature <- function(EGDD){
  percentDeduction <- EGDD/-20 + 85
  if(percentDeduction<0) percentDeduction <- 0 #can't have a negative deduction (when it's subtracted that would result in adding points)
  return(percentDeduction)
}
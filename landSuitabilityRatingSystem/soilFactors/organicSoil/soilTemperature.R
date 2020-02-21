# Title     : Soil Temperature
# Objective : Calculate the point deductions based on soil temperature
# Created by: CurtisTh
# Created on: 2020-01-22

soilTemperature <- function(EGDD){
  pointDeduction <- EGDD/-20 + 85
  #Prevent negative deductions and deductions greater than 25 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 25, 25, pointDeduction))
  return(pointDeduction)
}
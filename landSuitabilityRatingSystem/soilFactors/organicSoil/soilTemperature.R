# Title     : Soil Temperature
# Objective : Calculate the organic soil temperature deduction (Z) (Table 5.2).
# Created by: CurtisTh
# Created on: 2020-01-22

soilTemperature <- function(EGDD){
  pointDeduction <- EGDD/-20 + 85
  #Prevent negative deductions and deductions greater than 25 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 25, 25, pointDeduction))
  return(pointDeduction)
}
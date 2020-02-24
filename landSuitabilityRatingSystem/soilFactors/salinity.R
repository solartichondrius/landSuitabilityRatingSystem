# Title     : Salinity
# Objective : Calculate the deduction points based on salinity
# Created by: CurtisTh
# Created on: 2020-01-22

salinity <- function(salinity){
  pointDeduction <- (278.70426*salinity^0.87021431 - 28.704261*17.748344)/(17.748344 + salinity^0.87021431)
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 100, 100, pointDeduction))
  return(pointDeduction)
}
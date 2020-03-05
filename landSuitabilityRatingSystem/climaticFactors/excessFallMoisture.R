# Title     : Excess Fall Moisture
# Objective : Calculate the percent deduction for P-PE in September
# Created by: CurtisTh
# Created on: 2020-01-20

excessFallMoisture <- function(efm){

  #calculate the percent deduction based on excess fall moisture.
  percentDeduction <- efm / 10
  #Prevent negative deductions and deductions greater than 10.
  percentDeduction[percentDeduction<0] <- 0
  percentDeduction[percentDeduction>10] <- 10
  return(percentDeduction)
}
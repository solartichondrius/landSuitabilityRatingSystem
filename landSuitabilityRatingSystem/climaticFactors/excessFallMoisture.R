# Title     : Excess Fall Moisture
# Objective : Calculate the percent deduction for P-PE in September
# Created by: CurtisTh
# Created on: 2020-01-20

excessFallMoisture <- function(efm){

  #calculate the percent deduction based on the moisture factor (A)
  percentDeduction <- efm / 10

  #Return the percent deduction
  return(percentDeduction)

}
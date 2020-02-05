# Title     : Excess Spring Moisture
# Objective : Calculate the percent deduction using the P-PE index for May as the rating variable
# Created by: CurtisTh
# Created on: 2020-01-20

excessSpringMoisture <- function(esm){

  #calculate the percent deduction based on the moisture factor (A)
  percentDeduction <- esm / 10 + 5

  #Return the percent deduction
  return(percentDeduction)

}
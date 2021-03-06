# Title     : Excess Spring Moisture
# Objective : Calculate the percent deduction using the P-PE index for May as the rating variable
# Created by: CurtisTh
# Created on: 2020-01-20

excessSpringMoisture <- function(cropType, esm){

  #calculate the percent deduction based on excess spring moisture.
  if(cropType=="SSSG") percentDeduction <- esm / 10 + 5
  #Prevent negative deductions and deductions greater than 10.
  percentDeduction[percentDeduction<0] <- 0
  percentDeduction[percentDeduction>10] <- 10
  return(percentDeduction)
}
# Title     : Excess Spring Moisture
# Objective : Calculate the percent deduction using the P-PE index for May as the rating variable
# Created by: CurtisTh
# Created on: 2020-01-20

excessSpringMoisture <- function(esm){

  #calculate the percent deduction based on excess spring moisture.
  percentDeduction <- esm / 10 + 5
  #Prevent negative deductions and deductions greater than 10.
  percentDeduction <- ifelse(percentDeduction < 0, 0, 
                           ifelse(percentDeduction > 10, 10, percentDeduction))
  return(percentDeduction)
}
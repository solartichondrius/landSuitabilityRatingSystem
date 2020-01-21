# Title     : Excess Fall Moisture
# Objective : Calculate the percent deduction for P-PE in September
# Created by: CurtisTh
# Created on: 2020-01-20

excessFallMoisture <- function(...){

  A <- AorPPE(...) #allows you to enter either the calculated moisture factor (A) or precipitation (P) and evapotranspiration (PE)

  #calculate the percent deduction based on the moisture factor (A)
  percentDeduction <- 10 * A / 100

  #individual modifiers should not exceed 10% deduction
  if(percentDeduction > 10){ #so if the percent deduction is more than 10%
    percentDeduction <- 10 #then set it to be equal to 10%
  }

  #Return the percent deduction
  return(percentDeduction)

}
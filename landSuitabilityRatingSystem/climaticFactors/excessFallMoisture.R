# Title     : Excess Fall Moisture
# Objective : Calculate the percent deduction for P-PE in September
# Created by: CurtisTh
# Created on: 2020-01-20

excessFallMoisture <- function(efm){

<<<<<<< HEAD
=======
  loadFiles("climaticFactors/AorPPE.R")
>>>>>>> 83437dc93bcb66569b70252f7c965cd25c459335
  #A <- AorPPE(efm) #allows you to enter either the calculated moisture factor (A) or precipitation (P) and evapotranspiration (PE)

  #calculate the percent deduction based on the moisture factor (A)
  percentDeduction <- efm / 10

  #individual modifiers should not exceed 10% deduction
  if(percentDeduction > 10){ #so if the percent deduction is more than 10%
    percentDeduction <- 10 #then set it to be equal to 10%
  }

  #By default the LSRS calculator inserts a value of “-50” which equates to a zero % deduction
  if(efm==-50 | percentDeduction<0) { #so if the value is -50
    percentDeduction <- 0 #set the percent deduction to 0
  }

  #Return the percent deduction
  return(percentDeduction)

}
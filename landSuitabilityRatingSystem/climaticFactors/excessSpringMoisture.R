# Title     : Excess Spring Moisture
# Objective : Calculate the percent deduction using the P-PE index for May as the rating variable
# Created by: CurtisTh
# Created on: 2020-01-20

excessSpringMoisture <- function(esm){

<<<<<<< HEAD
  #calculate the percent deduction based on excess spring moisture.
  percentDeduction <- esm / 10 + 5
  #Prevent negative deductions and deductions greater than 10.
  percentDeduction <- ifelse(percentDeduction < 0, 0, 
                           ifelse(percentDeduction > 10, 10, percentDeduction))
=======
  if(is.na(esm)) return(NA) #if value is null return null value

  #calculate the percent deduction based on the moisture factor (A)
  percentDeduction <- esm / 10 + 5

  #individual modifiers should not exceed 10% deduction
  # if(all(percentDeduction > 10)){ #so if the percent deduction is more than 10%
  #   percentDeduction <- 10 #then set it to be equal to 10%
  # }

  #By default the LSRS calculator inserts a value of “-50” which equates to a zero % deduction
  if(all(esm==-50 | percentDeduction<0)){ #so if the value is -50
    percentDeduction <- 0 #set the percent deduction to 0
  }

  #Return the percent deduction
>>>>>>> b1004ff2a4b1e1f7a06a85476463b5751a423dd4
  return(percentDeduction)
}
# Title     : Fall Frost
# Objective : Calculate the percent deduction for early frost
# Created by: CurtisTh
# Created on: 2020-01-20

fallFrost <- function(DBAFF){

  #calculate the percent deduction based on the days before average fall frost (DBAFF)
  percentDeduction <-  10 * DBAFF / 30

  #individual modifiers should not exceed 10% deduction
  if(percentDeduction > 10){ #so if the percent deduction is more than 10%
    percentDeduction <- 10 #then set it to be equal to 10%
  }

  #Return the percent deduction
  return(percentDeduction)

}

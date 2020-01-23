# Title     : Fall Frost
# Objective : Calculate the percent deduction for early frost
# Created by: CurtisTh
# Created on: 2020-01-20

fallFrost <- function(DBAFF){

  #calculate the percent deduction based on the days before average fall frost (DBAFF)
  percentDeduction <-  DBAFF / 3

  #individual modifiers should not exceed 10% deduction
  if(percentDeduction > 10){ #so if the percent deduction is more than 10%
    percentDeduction <- 10 #then set it to be equal to 10%
  }

  if(percentDeduction<0) percentDeduction <- 0 #can't have a negative deduction (when it's subtracted that would result in adding points)

  #Return the percent deduction
  return(percentDeduction)

}

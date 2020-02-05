# Title     : Fall Frost
# Objective : Calculate the percent deduction for early frost
# Created by: CurtisTh
# Created on: 2020-01-20

fallFrost <- function(DBAFF){

  #calculate the percent deduction based on the days before average fall frost (DBAFF)
  percentDeduction <-  DBAFF / 3

  #Return the percent deduction
  return(percentDeduction)

}

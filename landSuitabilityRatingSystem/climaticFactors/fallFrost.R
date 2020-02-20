# Title     : Fall Frost
# Objective : Calculate the percent deduction for early frost
# Created by: CurtisTh
# Created on: 2020-01-20

fallFrost <- function(DBAFF){

  if(is.na(DBAFF)) return(NA) #if value is null return null value

  #calculate the percent deduction based on the days before average fall frost (DBAFF)
  percentDeduction <-  DBAFF / 3
  #Prevent negative deductions and deductions greater than 10 points.
  percentDeduction <- ifelse(percentDeduction < 0, 0, 
                           ifelse(percentDeduction > 10, 10, percentDeduction))
  return(percentDeduction)
}

# Title     : Sodicity
# Objective : Calculate the point deduction based on Sodicity
# Created by: CurtisTh
# Created on: 2020-01-22

sodicity <- function(SAR){
  pointDeduction <- 0.71428571*SAR + 0.17857143*SAR^2 - 6
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 100, 100, pointDeduction))
  return(pointDeduction)
}
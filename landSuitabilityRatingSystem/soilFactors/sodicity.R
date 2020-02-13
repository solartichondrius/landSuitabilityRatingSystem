# Title     : Sodicity
# Objective : Calculate the point deduction based on Sodicity
# Created by: CurtisTh
# Created on: 2020-01-22

sodicity <- function(SAR){
  pointDeduction <- 0.71428571*SAR + 0.17857143*SAR^2 - 6
  return(pointDeduction)
}
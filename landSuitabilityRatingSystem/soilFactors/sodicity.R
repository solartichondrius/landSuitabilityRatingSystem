# Title     : Sodicity
# Objective : Calculate the point deduction for mineral soils based on sodicity.
# Created by: CurtisTh
# Created on: 2020-01-22

sodicity <- function(cropType, SAR) {
  if (cropType == "SSSG") pointDeduction <- 0.71428571 * SAR + 0.17857143 * SAR^2 - 6
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
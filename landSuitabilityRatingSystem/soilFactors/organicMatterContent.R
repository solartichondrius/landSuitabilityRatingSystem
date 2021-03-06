# Title     : Organic Matter Content
# Objective : Calculate the point deduction for Organic Matter Content
# Created by: CurtisTh
# Created on: 2020-01-22

organicMatterContent <- function(cropType, organicCarbon) {
  if (cropType == "SSSG") pointDeduction <- 9.9928375 - 7.229321 * log(organicCarbon)
  #Prevent negative deductions and deductions greater than 15 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
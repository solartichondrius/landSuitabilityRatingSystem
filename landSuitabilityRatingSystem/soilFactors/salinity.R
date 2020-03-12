# Title     : Salinity
# Objective : Calculate the point deductions for mineral soils based on salinity.
# Created by: CurtisTh
# Created on: 2020-01-22

salinity <- function(cropType, salinity) {
  if (cropType == "SSSG") {
    pointDeduction <- (278.70426 * salinity^0.87021431 - 28.704261 * 17.748344) / (17.748344 + salinity^0.87021431)
  }
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
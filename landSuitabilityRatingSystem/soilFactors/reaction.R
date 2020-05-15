# Title     : Reaction
# Objective : Calculate the point deduction for mineral soils based on the soil PH value.
# Created by: CurtisTh
# Created on: 2020-01-22

reaction <- function(cropType, soilPH) {
  if (cropType == "SSSG") {
    #Mineral Reaction
    pointDeduction <- soilPH
    pointDeduction[soilPH>7.5] <- (2.7164411 * soilPH[soilPH>7.5] - 20.543722) / (1 - 0.07521742 * soilPH[soilPH>7.5] - 0.0031859168 * soilPH[soilPH>7.5]^2)
    pointDeduction[soilPH<=7.5 & soilPH>=6] <- 0
    pointDeduction[soilPH<6] <- 433.71429 - 140.85714 * soilPH[soilPH<6] + 11.428571 * soilPH[soilPH<6]^2
    pointDeduction <- pointDeduction
  }
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
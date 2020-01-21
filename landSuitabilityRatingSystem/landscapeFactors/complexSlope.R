# Title     : Complex Slope
# Objective : Calculate the deduction points for complex slopes
# Created by: CurtisTh
# Created on: 2020-01-21

complexSlope <- function(percentSlope){

  if(percentSlope < 5){
    pointDeduction <- 8 * percentSlope
  } else if(percentSlope < 15){
    pointDeduction <- 3 * percentSlope + 25
  } else if(percentSlope < 30){
    pointDeduction <- 2/3 * percentSlope + 60
  } else {
    pointDeduction <- percentSlope / 3 + 70
  }

  return(pointDeduction)

}
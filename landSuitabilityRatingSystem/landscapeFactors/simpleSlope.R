# Title     : Simple Slope
# Objective : Calculate the deduction points for simple slopes
# Created by: CurtisTh
# Created on: 2020-01-21

simpleSlope <- function(percentSlope){

  if(percentSlope < 10){
    pointDeduction <- 4 * percentSlope
  } else if(percentSlope < 20){
    pointDeduction <- 3 * percentSlope + 10
  } else if(percentSlope < 30){
    pointDeduction <- percentSlope + 50
  } else {
    pointDeduction <- percentSlope / 3 + 70
  }

  return(pointDeduction)

}
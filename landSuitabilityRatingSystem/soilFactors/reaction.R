# Title     : Reaction
# Objective : Calculate the point deductions based on the soil PH value
# Created by: CurtisTh
# Created on: 2020-01-22

reaction <- function(soilPH){
  if(soilPH <= 6){
    pointDeduction <- 433.71429 - 140.85714*soilPH + 11.428571*soilPH^2
  } else if(soilPH >= 7.5){
    pointDeduction <- (2.7164411*soilPH-20.543722)/(1 - 0.07521742*soilPH - 0.0031859168*soilPH^2)
  } else {
    pointDeduction <- 0
  }
  return(pointDeduction)
}
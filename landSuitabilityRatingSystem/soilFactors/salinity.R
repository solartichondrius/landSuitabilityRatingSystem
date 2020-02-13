# Title     : Salinity
# Objective : Calculate the deduction points based on salinity
# Created by: CurtisTh
# Created on: 2020-01-22

salinity <- function(salinity){
  pointDeduction <- (278.70426*salinity^0.87021431 - 28.704261*17.748344)/(17.748344 + salinity^0.87021431)
  #if(pointDeduction<0) pointDeduction <- 0 #can't have a negative deduction (when it's subtracted that would result in adding points)
  return(pointDeduction)
}
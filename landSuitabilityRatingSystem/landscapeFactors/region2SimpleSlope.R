# Title     : Region 2 Simple SLope
# Objective : Calculate the deduction points for simple slopes in region 2
# Created by: CurtisTh
# Created on: 2020-01-22

region2SimpleSlope <- function(percentSlope){
  pointDeduction <- 66.560928 + 2.156809*percentSlope - sqrt((2.156809*percentSlope - 38.609623)^2 + 54.877374^2)
  return(pointDeduction)
}


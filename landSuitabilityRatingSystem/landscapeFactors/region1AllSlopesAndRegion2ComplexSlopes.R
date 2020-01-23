# Title     : Region 1 All Slopes & Region 2 Complex Slopes
# Objective : Calculate the point deduction for all slopes in region 1 and complex slopes in region 2
# Created by: CurtisTh
# Created on: 2020-01-22

region1AllSlopesAndRegion2ComplexSlopes <- function(percentSlope){
  pointDeduction <- 128.20977 + 8.5212186*percentSlope - sqrt((24.148183 + 8.5212186*percentSlope)^2 + 126.64124^2)
  if(pointDeduction<0) pointDeduction <- 0 #can't have a negative deduction (when it's subtracted that would result in adding points)
  return(pointDeduction)
}
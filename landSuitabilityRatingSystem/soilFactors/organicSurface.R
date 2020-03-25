# Title     : Organic (Peaty) Surface
# Objective : Calculate the point deduction based on organic (peaty) surface
# Created by: CurtisTh
# Created on: 2020-01-22

organicSurface <- function(cropType, pDepth, bd) {
  if (cropType == "SSSG") {
    #D=depth of organic horizon(s)(Ox), Db=bulk density of organic horizon
    #bd <- ifelse(bd == 0, 0.12, bd)
    pointDeduction <- pDepth
    pointDeduction[pDepth>=10] <- (pDepth[pDepth>=10] - 10) * (sqrt(0.12) / sqrt(bd[pDepth>=10]))
    pointDeduction[pDepth<10] <- 0
    pointDeduction <- pointDeduction
  }
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
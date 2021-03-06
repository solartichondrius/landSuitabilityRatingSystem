# Title     : Climate Moisture Factor (A)
# Objective : Calculate the deduction points for the moisture factor from May to August
# Created by: CurtisTh
# Created on: 2020-01-20

climateMoisture <- function(cropType, ppe){

  #Calculate the point deduction number based on the moisture component (A)
  #The graph in figure 3.1 on page 8 reaches 0 point deduction at 0mm which gives the following formula:
  #pointDeduction <- 70 * ppe / -500
  
  #But the text says that it reaches 0 point deduction at -150mm which gives the following formula:
  if(cropType=="SSSG") pointDeduction <- ppe / -5 - 30
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
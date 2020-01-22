# Title     : Moisture Factor (A)
# Objective : Calculate the deduction points for the moisture factor from May to August
# Created by: CurtisTh
# Created on: 2020-01-20

moistureFactor <- function(...){

  A <- AorPPE(...) #allows you to enter either the calculated moisture factor (A) or precipitation (P) and evapotranspiration (PE)

  #Calculate the point deduction number based on the moisture component (A)
  #The graph in figure 3.1 on page 8 reaches 0 point deduction at 0mm which gives the following formula:
  #pointDeduction <- 70 * A / -500
  #But the text says that it reaches 0 point deduction at -150mm which gives the following formula:
  pointDeduction <- A / -5 - 30

  #Return the point deduction number
  return(pointDeduction)

}
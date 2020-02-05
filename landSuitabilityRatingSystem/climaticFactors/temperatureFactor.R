# Title     : Temperature Factor (H)
# Objective : Calculate the point deduction for the Temperature Factor (H)
# Created by: CurtisTh
# Created on: 2020-01-20

temperatureFactor <- function(EGDD){

  pointDeduction <- ifelse(EGDD < 900, -0.05 * EGDD + 115, 
                                 -0.10 * EGDD + 160.00)

  #if(all(pointDeduction<0)) pointDeduction <- 0 #can't have a negative deduction (when it's subtracted that would result in adding points)

  #Return the point deduction number
  return(pointDeduction)

}

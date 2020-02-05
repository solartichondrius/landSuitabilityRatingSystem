# Title     : Temperature Factor (H)
# Objective : Calculate the point deduction for the Temperature Factor (H)
# Created by: CurtisTh
# Created on: 2020-01-20

temperatureFactor <- function(EGDD){

  if(is.na(EGDD)) return(NA) #if value is null return null value

  if(EGDD < 900){ #if the number of Effective Growing Degree days is less than 900 then the following formula is used to calculate the point deduction:
    pointDeduction <- -0.05 * EGDD + 115
  } else { #if the number of Effective Growing Degree Days is greater than 900 then the following formula is used to calculate the point deduction:
    pointDeduction <- -0.10 * EGDD + 160.00
  }

  if(pointDeduction<0) pointDeduction <- 0 #can't have a negative deduction (when it's subtracted that would result in adding points)

  #Return the point deduction number
  return(pointDeduction)

}

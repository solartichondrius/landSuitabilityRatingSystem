# Title     : Stoniness
# Objective : Calculate percent deduction based on stoniness
# Created by: CurtisTh
# Created on: 2020-01-21

stoniness <- function(annualRemoval){ #annual Removal in cubic m/ha
  percentDeduction <- 160 * annualRemoval / 3
  if(percentDeduction<0) percentDeduction <- 0 #can't have a negative deduction (when it's subtracted that would result in adding points)
  return(percentDeduction)
}

# Title     : Stoniness
# Objective : Calculate percent deduction based on stoniness
# Created by: CurtisTh
# Created on: 2020-01-21

stoniness <- function(annualRemoval){ #annual Removal in cubic m/ha
  percentDeduction <- 160 * annualRemoval / 3
  return(percentDeduction)
}

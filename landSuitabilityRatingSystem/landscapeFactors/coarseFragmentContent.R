# Title     : Coarse Fragment Content
# Objective : Calculate the percent deduction based on coarse fragment (gravel) content
# Created by: CurtisTh
# Created on: 2020-01-21

coarseFragmentContent <- function(vol){ # % Volume
  percentDeduction <- vol*0.96285714 - 0.0057142857*vol^2 -9
  if(percentDeduction<0) percentDeduction <- 0 #can't have a negative deduction (when it's subtracted that would result in adding points)
  return(percentDeduction)
}
# Title     : Coarse Fragment Content
# Objective : Calculate the percent deduction based on coarse fragment (gravel) content
# Created by: CurtisTh
# Created on: 2020-01-21

coarseFragmentContent <- function(vol){ # % Volume

  if(vol < 30){
    percentDeduction <- 3/4 * vol - 7.5
  } else {
    percentDeduction <- vol / 2
  }

  return(percentDeduction)

}
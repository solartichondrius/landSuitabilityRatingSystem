# Title     : Wood Content
# Objective : Calculate percent deduction for wood content in organic soils
# Created by: CurtisTh
# Created on: 2020-01-22

woodContent <- function(surface,subsurface){ #surface and subsurface wood content by percent volume.
  percentDeduction <- 2*surface + subsurface
  if (percentDeduction > 25){
    percentDeduction <- 25 #maximum deduction allowed is 25 so if it's more than 25 set it to 25.
  }
  if (percentDeduction<0){
    percentDeduction <- 0 #If -9 (no value / unknown) appears in the Agrasid database, then use0 for calculating deduction -- this will lead to a 0 deduction being determined.
  }
  return(percentDeduction)
}
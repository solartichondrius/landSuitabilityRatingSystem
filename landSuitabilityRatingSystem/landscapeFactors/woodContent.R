# Title     : Wood Content
# Objective : Calculate percent deduction for wood content in organic soils
# Created by: CurtisTh
# Created on: 2020-01-22

woodContent <- function(surface, subsurface){ #surface and subsurface wood content by percent volume.
  percentDeduction <- 2*surface + subsurface
  return(percentDeduction)
}
# Title     : Wood Content
# Objective : Calculate percent deduction for wood content in organic soils
# Created by: CurtisTh
# Created on: 2020-01-22

woodContent <- function(surface, subsurface){ #surface and subsurface wood content by percent volume.
  pointDeduction <- 2*surface + subsurface
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 25, 25, pointDeduction))
  return(pointDeduction)
}
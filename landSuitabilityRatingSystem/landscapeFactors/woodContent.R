# Title     : Wood Content
# Objective : Calculate percent deduction for wood content in organic soils
# Created by: CurtisTh
# Created on: 2020-01-22

woodContent <- function(cropType, surfaceWC, subsurfaceWC){ #surface and subsurface wood content by percent volume.
  if(cropType=="SSSG") pointDeduction <- 2*surfaceWC + subsurfaceWC
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>25] <- 25
  return(pointDeduction)
}
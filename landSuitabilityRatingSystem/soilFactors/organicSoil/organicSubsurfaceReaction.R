#February 21, 2020
#Hayden McAdam
#Calculates subsurface reaction deduction (V) for organic soils (Table 5.10).
organicSubsurfaceReaction <- function(cropType, subsurfacePH){
  if(cropType=="SSSG") pointDeduction <- 60 + -10 * subsurfacePH
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
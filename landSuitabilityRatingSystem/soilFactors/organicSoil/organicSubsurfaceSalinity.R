#February 21, 2020
#Hayden McAdam
#Calculates subsurface salinity deduction (N) for organic soils (Table 5.11).
organicSubsurfaceSalinity <- function(cropType, subsurfaceEC){
  if (cropType == "SSSG") pointDeduction <- (-13.333333 + 3.75 * subsurfaceEC + -0.10416667 * subsurfaceEC ^ 2)
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
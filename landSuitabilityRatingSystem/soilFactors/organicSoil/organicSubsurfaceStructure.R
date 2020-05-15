#February 21, 2020
#Hayden McAdam
#Calculates subsurface structure/consistence deduction (B)
#using subsurface fibre content (Table 5.8).
organicSubsurfaceStructure <- function(cropType, subsurfaceFibre){
  if(cropType=="SSSG") {
    pointDeduction <- subSurfaceFibre
    pointDeduction[pointDeduction>=40] <- pointDeduction/2 -20 +256
    pointDeduction[pointDeduction<=20] <- (20-pointDeduction)/(1+pointDeduction/10) +256
    pointDeduction[pointDeduction>20&pointDeduction<40] <- 0 +256
    pointDeduction <- pointDeduction -256
}
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
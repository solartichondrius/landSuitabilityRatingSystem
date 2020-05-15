#January 21, 2020
#Hayden McAdam
#Calculate stoniness point deduction (P) based on the amount of 
#coarse fragments (cf) present in the soil surface.
stoniness <- function(cropType, cf) {
  #Point deduction for volume of coarse fragments in the soil.
  if(cropType=="SSSG") pointDeduction <- 0.96285714*cf-9-0.0057142857*cf^2
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
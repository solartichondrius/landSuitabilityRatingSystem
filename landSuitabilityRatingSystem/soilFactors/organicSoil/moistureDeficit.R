#February 21, 2020
#Hayden McAdam
#Initial point deduction for moisture deficit factor (M) 
#in organic soils (Table 5.3).
moistureDeficit <- function(cropType, surfaceFibre, ppe){
  if(cropType=="SSSG") pointDeduction <- (40 * (surfaceFibre / 80)) - (((250 + ppe) / 50) * 5)
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
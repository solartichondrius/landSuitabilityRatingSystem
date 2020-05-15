#February 21, 2020
#Hayden McAdam
#Calculates the water table adjustment 
#for the organic soil moisture deficit factor (M) (Table 5.4).
waterTableAdjustment <- function(cropType, waterTableDepth, subsurfaceFibre){
  if(cropType=="SSSG") pointDeduction <- 100-((waterTableDepth^2)/12)/(5+(10/(0.1*subsurfaceFibre)))
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
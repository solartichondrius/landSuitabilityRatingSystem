#February 21, 2020
#Hayden McAdam
#Calculates surface salinity deduction (N) for organic soils (Table 5.7).
organicSalinity <- function(cropType, surfaceEC){
  if(cropType=="SSSG") pointDeduction <- (-13.230275*22.752925+94.480275*surfaceEC^1.67181) / (22.752925+surfaceEC^1.67181)
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
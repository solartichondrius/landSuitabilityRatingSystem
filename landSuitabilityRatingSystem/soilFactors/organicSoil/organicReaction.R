#February 21, 2020
#Hayden McAdam
#Calculates surface reaction deduction (V) for organic soils (Table 5.6).
organicReaction <- function(cropType, surfaceFibre, soilPH){
  if(cropType=="SSSG"){
    pointDeduction <- soilPH
    pointDeduction[pointDeduction>=5.5] <- 40 * ((sqrt(surfaceFibre))/8.9) +256
    pointDeduction[pointDeduction<5.5] <- (40*((sqrt(surfaceFibre))/8.9))+(((5.5 - soilPH)/0.1)*(1+((sqrt(100/surfaceFibre+0.1)))*0.1)) +256
    pointDeduction <- pointDeduction -256
  }
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
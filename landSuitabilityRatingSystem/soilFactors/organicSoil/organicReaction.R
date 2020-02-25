#February 21, 2020
#Hayden McAdam
#Calculates surface reaction deduction (V) for organic soils (Table 5.6).
organicReaction <- function(surfaceFibre, soilPH){
  pointDeduction <- ifelse(soilPH < 5.5, (40*((sqrt(surfaceFibre))/8.9))
                     +(((5.5 - soilPH)/0.1)*(1+((sqrt(100/surfaceFibre+0.1)))*0.1)),
                     40 * ((sqrt(surfaceFibre))/8.9))
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 100, 100, pointDeduction))
  return(pointDeduction)
}
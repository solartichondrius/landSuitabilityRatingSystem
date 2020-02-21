#February 21, 2020
#Hayden McAdam
#Organic Moisture Deficit Factor (M)
moistureDeficit <- function(surfaceFibre, ppe){
  pointDeduction <- (40 * (surfaceFibre / 80)) - (((250 + ppe) / 50) * 5)
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 100, 100, pointDeduction))
  return(pointDeduction)
}
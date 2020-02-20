#January 21, 2020
#Hayden McAdam
#Calculate stoniness point reduction (P) based on the amount of 
#coarse fragments (cf) present in the soil surface.
stoniness <- function(cf) {
  #Point deduction for volume of coarse fragments in the soil.
  a <- -9
  b <- 0.96285714
  c <- -0.0057142857
  pointDeduction <- a+b*cf+c*cf^2
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                       ifelse(pointDeduction > 100, 100, pointDeduction))
  return(pointDeduction)
}
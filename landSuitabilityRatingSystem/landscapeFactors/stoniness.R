#January 21, 2020
#Hayden McAdam
#Calculate stoniness point reduction (P) based on the amount of stones (s)
#and coarse fragments (cf) present in the soil surface.
stoniness <- function(cf) {
  #Point deduction for amount of stone anually removed from the surface.
  #This is no longer being used, since we only have coarse fragment data.
  #deductionP1 <- 53.333333 * s
  #Point deduction for volume of coarse fragments in the soil.
  a <- -9
  b <- 0.96285714
  c <- -0.0057142857
  pointDeduction <- a+b*cf+c*cf^2
  #Add the stoniness and coarse fragment deductions to calculate final P value.
  #deductionP <- deductionP1 + deductionP2
  if(pointDeduction<0) pointDeduction <- 0 #can't have a negative deduction (when it's subtracted that would result in adding points)
  return(pointDeduction)
}
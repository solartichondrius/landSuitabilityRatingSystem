#January 21, 2020
#Hayden McAdam
#Calculate stoniness point reduction (P) based on the amount of stones (s)
#and coarse fragments (cf) present in the soil surface.
pRating <- function(s, cf) {
  #Point deduction for amount of stone anually removed from the surface.
  deductionP1 <- 53.333333 * s
  #Point deduction for volume of coarse fragments in the soil.
  a <- -9
  b <- 0.96285714
  c <- -0.0057142857
  deductionP2 <- a+b*cf+c*cf^2
  #Add the stoniness and coarse fragment deductions to calculate final P value.
  deductionP <- deductionP1 + deductionP2
  return(deductionP)
}
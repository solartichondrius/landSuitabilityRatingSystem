# Title     : Landscape Rating Class
# Objective : Take the landscape rating points and and turn them into a class from 1 to 7
# Created by: CurtisTh
# Created on: 2020-01-21

landscapeRatingClass <- function(cropType, region, ps, lt, cf,
                                  surface, subsurface, pattern,
                                  inundationPeriod, usableGrowingSeasonLength,
                                  frequency, printProgress=FALSE) {

  #calculate the landscape rating points:
  lrp <- landscapeRatingPoints(cropType, region,ps,lt,cf,surface,subsurface,pattern,inundationPeriod,usableGrowingSeasonLength,frequency,printProgress)
  landscapePoints <- lrp[[1]] #the first value returned is the final rating points
  if(printProgress) incProgress(0.1, detail = ("converting points to class")) #print the progress to the website
  class <- pointsToClass(landscapePoints)*100000 #calculate the class based on the points, then multiply it by 100000 so it's in the first digit on the left
  if(printProgress) incProgress(0.1, detail = ("calculating final rating class")) #print the progress to the website
  t <- lrp[[2]] #the second value returned is the topography deduction, which we want to know if it's more or less than 15
  t[t<15] <- 0 #if it's less than 15 then we give it a value of 0 as in "FALSE"
  t[t>=15] <- 10000 #if it's 15 or more then we give it a value of 1 as in "TRUE", multiplied by 10000 so it's in the second digit from the left
  P <- lrp[[3]] #the third value returned is the stoniness deduction, which we want to know if it's more or less than 15
  P[P<15] <- 0 #if it's less than 15 then we give it a value of 0 as in "FALSE"
  P[P>=15] <- 1000 #if it's 15 or more then we give it a value of 1 as in "TRUE" in the ones column, multiplied by 1000 so it's in the third digit from the left
  J <- lrp[[3]] #the third value returned is the wood content deduction, which want want to know if it's more or less than 15
  J[J<15] <- 0 #if it's less than 15 we give it a value of 0 as in "FALSE"
  J[J>=15] <- 100 #if it's 15 or more we give it a value of 1 as in "TRUE", multiplied by 100 so it's in the fourth digit from the left
  K <- lrp[[4]] #the third value returned is the pattern deduction, which we want to know if it's more or less than 15
  K[K<15] <- 0 #if it's less than 15 we give it a value of 0 as in "FALSE"
  K[K>=15] <- 10 #if it's 15 or more then we give it a value of 1 as in "TRUE, multiplied by 10 so it's in the fifth digit from the left
  I <- lrp[[5]] #the last value returned is the flooding deduction, which we want to know if it's more or less than 15
  I[I<15] <- 0 #if it's less than 15 we give it a value of 0 as in "FALSE"
  I[I>=15] <- 1 #if it's 15 or more we give it a value of 1 as in "TRUE", not multiplied by anything so it's the last digit
  if(printProgress) incProgress(0.1, detail = ("processing final rating class")) #print the progress to the website
  finalRatingClass <- class + t + P + J + K + I #the final rating class is a combination of the final rating class (a number between 1 and 7),
  #and a 1 or a 0 representign TRUE or FALSE for whether or not each of the different deductions were 15 or more points/percent

  return(c(landscapePoints, finalRatingClass))
}
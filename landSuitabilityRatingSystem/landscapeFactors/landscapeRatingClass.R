# Title     : Landscape Rating Class
# Objective : Take the landscape rating points and and turn them into a class from 1 to 7
# Created by: CurtisTh
# Created on: 2020-01-21

landscapeRatingClass <- function(cropType,ps,lsFactor,printProgress=FALSE) {

  #Calculate the landscape rating points:
  lrp <- landscapeRatingPoints(cropType, ps, lsFactor, printProgress)
  
  #The first value returned is the final rating points
  landscapePoints <- lrp[[1]] 
  #Print the progress to the website
  if(printProgress) incProgress(0.1, detail = ("converting points to class")) 
  #Calculate the class based on the points, 
  #then multiply it by 100000 so it's the first digit on the left
  class <- pointsToClass(landscapePoints)*10#0000 
  #Print the progress to the website
  if(printProgress) incProgress(0.1, detail = ("calculating final rating class")) 
  
  #Add subclasses to the class as a numeric value 
  #to indicate which factors resulted in a deduction of more than 15 points.
  t <- lrp[[2]]
  t[t<15] <- 0 
  t[t>=15] <- 1#0000 
  # P <- lrp[[3]] 
  # P[P<15] <- 0 
  # P[P>=15] <- 1000 
  # J <- lrp[[4]] 
  # J[J<15] <- 0 
  # J[J>=15] <- 100 
  # K <- lrp[[5]] 
  # K[K<15] <- 0 
  # K[K>=15] <- 10 
  # I <- lrp[[6]] 
  # I[I<15] <- 0 
  # I[I>=15] <- 1
  
  #Print the progress to the website
  if(printProgress) incProgress(0.1, detail = ("processing final rating class")) 
  #The final rating class is a combination of the final rating class (a number between 1 and 7),
  #and a 1 or a 0 representing TRUE or FALSE for whether or not each of the 
  #different deductions were more than 15 points/percent
  finalRatingClass <- class + t# + P + J + K + I 

  return(c(landscapePoints, finalRatingClass))
}
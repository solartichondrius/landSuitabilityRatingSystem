# Title     : Climate Rating Class
# Objective : Take the climate rating points and and turn them into a class from 1 to 7
# Created by: CurtisTh
# Created on: 2020-01-21

climateRatingClass <- function(cropType, PPE, springPPE, fallPPE, EGDD, DBAFF, printProgress = FALSE) {

  #Calculate the climate rating points.
  crp <- climateRatingPoints(cropType, PPE, springPPE, fallPPE, EGDD, DBAFF, printProgress)
  climatePoints <- crp[[1]]
  
  #Print the progress to the website.
  if (printProgress) incProgress(0.1, detail = ("converting points to class"))
  #Calculate the class based on the points, 
  #then multiply it by 100 so it's the first digit on the left
  class <- pointsToClass(climatePoints) * 100
  
  #Add subclasses to the class as a numeric value 
  #to indicate which factors resulted in a deduction of more than 15 points.
  md <- crp[[2]] 
  md[md < 15] <- 0 
  md[md >= 15] <- 10 
  td <- crp[[3]] 
  td[td < 15] <- 0 
  td[td >= 15] <- 1
  if (printProgress) incProgress(0.1, detail = ("calculating final rating class")) 
  finalRatingClass <- class + md + td 

  return(c(climatePoints, finalRatingClass))
}
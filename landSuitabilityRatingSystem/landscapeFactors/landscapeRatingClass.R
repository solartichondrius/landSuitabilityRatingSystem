# Title     : Landscape Rating Class
# Objective : Take the landscape rating points and and turn them into a class from 1 to 7
# Created by: CurtisTh
# Created on: 2020-01-21

source("landscapeFactors/landscapePointsToClass.R")

landscapeRatingClass <- function(points, t, p, j, k, i) {

  for (n in 1:length(lsRatingTable$points)) {
    number <- lsRatingTable$points[n]
    class <- landscapePointsToClass(number)
    
    if (t[n]>15){class <- paste(class, "T", sep="")}
    if (p[n]>15){class <- paste(class, "P", sep="")}
    if (j[n]>15){class <- paste(class, "J", sep="")}
    if (k[n]>15){class <- paste(class, "K", sep="")}
    if (i[n]>15){class <- paste(class, "I", sep="")}
    
    lsRatingTable$class[n] <- class
  }
  
  return(lsRatingTable$class)
  
}
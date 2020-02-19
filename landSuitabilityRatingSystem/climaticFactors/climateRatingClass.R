# Title     : Climate Rating Class
# Objective : Take the climate rating points and and turn them into a class from 1 to 7
# Created by: CurtisTh
# Created on: 2020-01-21

climateRatingClass <- function(points, moistureDeduction, temperatureDeduction){
  
  for (i in 1:length(clRatingTable$points)) {
    numbers <- clRatingTable$points[i]
    class <- pointsToClass(numbers)
    
    if (moistureDeduction[i]>15){class <- paste(class, "A", sep="")}
    if (temperatureDeduction[i]>15){class <- paste(class, "H", sep="")}
    
    clRatingTable$class[i] <- class
  }
  
  return(clRatingTable$class)
  }
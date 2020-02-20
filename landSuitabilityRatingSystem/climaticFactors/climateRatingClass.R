# Title     : Climate Rating Class
# Objective : Take the climate rating points and and turn them into a class from 1 to 7
# Created by: CurtisTh
# Created on: 2020-01-21

climateRatingClass <- function(points, a, h){
  
<<<<<<< HEAD
  #Loop through the climate table and assign a class to each row.
  for (n in 1:length(clRatingTable$points)) {
    #Assign a numeric class based on the points value.
    number <- clRatingTable$points[n]
    class <- pointsToClass(number)
    #Add subclasses to the class to indicate which deductions were made.
    if (a[n]>15){class <- paste(class, "A", sep="")}
    if (h[n]>15){class <- paste(class, "H", sep="")}
    clRatingTable$class[n] <- class
=======
  for (i in 1:length(clRatingTable$points)) {
    numbers <- clRatingTable$points[i]
    class <- pointsToClass(numbers)
    
    if (moistureDeduction[i]>15){class <- paste(class, "A", sep="")}
    if (temperatureDeduction[i]>15){class <- paste(class, "H", sep="")}
    
    clRatingTable$class[i] <- class
>>>>>>> b1004ff2a4b1e1f7a06a85476463b5751a423dd4
  }
  return(clRatingTable$class)
  }
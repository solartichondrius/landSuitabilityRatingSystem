# Title     : Landscape Rating Class
# Objective : Take the landscape rating points and and turn them into a class from 1 to 7
# Created by: CurtisTh
# Created on: 2020-01-21

landscapeRatingClass <- function(points, t, p, j, k, i) {

  #Loop through the climate table and assign a class to each row.
  for (n in 1:length(lsRatingTable$points)) {
    #Assign a numeric class based on the points value.
    number <- lsRatingTable$points[n]
    class <- pointsToClass(number)
    #Add subclasses to the class to indicate which deductions were made.
    if (t[n]>15){class <- paste(class, "T", sep="")}
    if (p[n]>15){class <- paste(class, "P", sep="")}
    if (j[n]>15){class <- paste(class, "J", sep="")}
    if (k[n]>15){class <- paste(class, "K", sep="")}
    if (i[n]>15){class <- paste(class, "I", sep="")}
    lsRatingTable$class[n] <- class
  }
  return(lsRatingTable$class)
}
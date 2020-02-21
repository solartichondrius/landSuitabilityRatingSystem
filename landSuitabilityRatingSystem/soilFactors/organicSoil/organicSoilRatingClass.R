#February 21, 2020
#Hayden McAdam
#Organic Soil Rating Class
#Assign each row a suitability class from 1 - 7 based on the value of points.

organicSoilRatingClass <- function(points, z, m, s, v, n, sb, g, sv, sn, w){
  #Loop through the soil table and assign a class to each row.
  for (i in 1:length(slRatingTable$points)) {
    #Assign a numeric class based on the points value.
    numbers <- slRatingTable$points[i]
    class <- pointsToClass(numbers)
    #Add subclasses to the class to indicate which deductions were made.
    if(z[i]>15){class <- paste(class, "Z", sep="")}
    if(m[i]>15){class <- paste(class, "M", sep="")}
    if(s[i]>15 || sb[i]>15){class <- paste(class, "B", sep="")}
    if(v[i]>15 || sv[i]>15){class <- paste(class, "V", sep="")}
    if(n[i]>15 || sn[i]>15){class <- paste(class, "N", sep="")}
    if(g[i]>15){class <- paste(class, "G", sep="")}
    if(w[i]>15){class <- paste(class, "W", sep="")}
    slRatingTable$class[i] <- class
  }
  return(slRatingTable$class)
}
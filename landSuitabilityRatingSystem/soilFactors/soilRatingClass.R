#February 10, 2020
#Hayden McAdam
soilRatingClass <- function(points, m, d, f, v, sv, n, sn, y, sy){
  
  for (i in 1:length(slRatingTable$points)) {
    numbers <- slRatingTable$points[i]
    class <- pointsToClass(numbers)
    if(m[i] > 15){class <- paste(class, "M", sep="")}
    #if(m[i] > 15 & m[i] > a+15){class <- paste(class, "M", sep="")}
    #if(a[i] > 15 & !m[i] > a+15){class <- paste(class, "A", sep="")}
    if(d[i]>15){class <- paste(class, "D", sep="")}
    if(f[i]>15){class <- paste(class, "F", sep="")}
    #if(e[i]>15){class <- paste(class, "E", sep="")}
    if(v[i]>15 | sv[i]>15){class <- paste(class, "V", sep="")}
    if(n[i]>15 | sn[i]>15){class <- paste(class, "N", sep="")}
    if(y[i]>15 | sy[i]>15){class <- paste(class, "Y", sep="")}
    #if(o[i]>15){class <- paste(class, "O", sep="")}
    #if(w[n]>15){class <- paste(class, "W", sep="")}
    slRatingTable$class[i] <- class
  }
  return(slRatingTable$class)
}
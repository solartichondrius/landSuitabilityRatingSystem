# Title     : Landscape Rating Class
# Objective : Take the landscape rating points and and turn them into a class from 1 to 7
# Created by: CurtisTh
# Created on: 2020-01-21

source("landscapeFactors/landscapeRatingPoints.R")
#source("pointsToClass.R")

landscapeRatingClass <- function(region, ps, lt, s, cf, 
                                 surface, subsurface, pattern, 
                                 inundationPeriod, usableGrowingSeasonLength, 
                                 frequency, points) {
  for (i in 1:length(lsTable$points)) {
    numbers <- lsTable$points[i]
    if (numbers >= 80) {
      class <- 1
    } else if (numbers >= 60 & numbers < 80) {
      class <- 2
    } else if (numbers >= 45 & numbers < 60) {
      class <- 3
    } else if (numbers >= 30 & numbers < 45) {
      class <- 4
    } else if (numbers >= 20 & numbers < 30) {
      class <- 5
    } else if (numbers >= 10 & numbers < 20) {
      class <- 6
    } else {
      class <- 7
    }
    lsTable$class[i] <- class
  }
  return(lsTable$class)
  #class <- pointsToClass(lsTable$points[1])
  # class <- pointsToClass(numbers[1])
  # if(numbers[2] >= 15 | numbers[3] >= 15) class <- paste(class,"P",sep="")
  # if(numbers[4] >= 15) class <- paste(class,"J",sep="")
  # if(numbers[5] >= 15) class <- paste(class,"K",sep="")
  # if(numbers[6] >= 15) class <- paste(class,"I",sep="")
  return(class)
}
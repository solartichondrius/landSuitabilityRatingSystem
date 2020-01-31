# Title     : Climate Rating Class
# Objective : Take the climate rating points and and turn them into a class from 1 to 7
# Created by: CurtisTh
# Created on: 2020-01-21

climateRatingClass <- function(points){
  
  for (i in 1:length(clTable$points)) {
    numbers <- clTable$points[i]
    class <- pointsToClass(numbers)
    clTable$class[i] <- class
  }
  return(clTable$class)
  
  # numbers <- climateRatingPoints(PPE,springPPE,fallPPE,EGDD,DBAFF)  #store the results of the climateRatingNumber function
  # class <- pointsToClass(numbers[1]) #the class (from 1 to 7) based on the number of points
  # if(numbers[2] >= 15) class <- paste(class,"A",sep="") #if the deduction points for the moisture factor (A) is 15 or greater add "A" as a subclass
  # if(numbers[3] >= 15) class <- paste(class,"H",sep="") #if the deduction points for the temperature factor (H) is 15 or greater add "H" as a subclass
  # return(class) #return the class
  }
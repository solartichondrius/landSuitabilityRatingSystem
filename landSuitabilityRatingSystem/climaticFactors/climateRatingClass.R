# Title     : Climate Rating Class
# Objective : Take the climate rating points and and turn them into a class from 1 to 7
# Created by: CurtisTh
# Created on: 2020-01-21

climateRatingClass <- function(PPE,springPPE,fallPPE,EGDD,DBAFF){ #takes all of the same arguments as the climateRatingNumber function

  #Load the files with the functions we will be using:
  source("climaticFactors/climateRatingPoints.R",echo=TRUE)
  source("pointsToClass.R",echo=TRUE)

  numbers <- climateRatingPoints(PPE,springPPE,fallPPE,EGDD,DBAFF)  #store the results of the climateRatingNumber function
  class <- pointsToClass(numbers[1]) #the class (from 1 to 7) based on the number of points
  if(numbers[2] >= 15) class <- paste(class,"A",sep="") #if the deduction points for the moisture factor (A) is 15 or greater add "A" as a subclass
  if(numbers[3] >= 15) class <- paste(class,"H",sep="") #if the deduction points for the temperature factor (H) is 15 or greater add "H" as a subclass
  return(class) #return the class

}

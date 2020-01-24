# Title     : Landscape Rating Class
# Objective : Take the landscape rating points and and turn them into a class from 1 to 7
# Created by: CurtisTh
# Created on: 2020-01-21

source("landscapeFactors/landscapeRatingPoints.R")

landscapeRatingClass <- function(region,ps,lt,s,cf,woodContent,pattern,flooding){
  numbers <- landscapeRatingPoints(region,ps,lt,s,cf,woodContent,pattern,flooding)
  class <- pointsToClass(numbers[1])
  if(numbers[2] >= 15 | numbers[3] >= 15) class <- paste(class,"P",sep="")
  if(numbers[4] >= 15) class <- paste(class,"J",sep="")
  if(numbers[5] >= 15) class <- paste(class,"K",sep="")
  if(numbers[6] >= 15) class <- paste(class,"I",sep="")
  return(class)
}

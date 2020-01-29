# Title     : Points To Class
# Objective : Returns a suitability class from 1 to 7 based on a given number of points from 0 to 100
# Created by: CurtisTh
# Created on: 2020-01-21

pointsToClass <- function(number){
    
  if(number >= 80){
    return(1)
  } else if(number >= 60){
    return(2)
  } else if(number >= 45){
    return(3)
  } else if(number >= 30){
    return(4)
  } else if(number >= 20){
    return(5)
  } else if(number >= 10){
    return(6)
  } else {
    return(7)
  }

}

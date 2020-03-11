# Title     : Climate Rating Class
# Objective : Take the climate rating points and and turn them into a class from 1 to 7
# Created by: CurtisTh
# Created on: 2020-01-21

climateRatingClass <- function(PPE, springPPE, fallPPE, EGDD){

  crp <- climateRatingPoints(PPE, springPPE, fallPPE, EGDD) #calculate the cliamte rating points
  climatePoints <- crp[[1]] #the first value returned is the final rating points
  md <- crp[[2]] #the second value returned is the moisture deduction, which we want to know if it's 15 or more
  md[md<15] <- 0 #if it's less than 15 then we give it a value of 0 as in "FALSE"
  md[md>=15] <- 10 #if it's 15 or more then we give it a value of 1 as in "TRUE", multiplied by 10 so it's in the tens column
  td <- crp[[3]] #the third value returned is the temperature deduction, which we want to know if it's more or les than 15
  td[td<15] <- 0 #if it's less than 15 then we give it a value of 0 as in "FALSE"
  td[td>=15] <- 1 #if it's 15 or more then we give it a value of 1 as in "TRUE" in the ones column
  class <- pointsToClass(climatePoints)*100 #calculate the class based on the points, then multiply it by 100 so it's in the hundreds column
  finalRatingClass <- class + md + td #the final rating class is the class (a number between 1 and 7) in the hundreds column,
  # a 1 or a 0 (as in TRUE or FALSE) in the tens column for whether the moisture deduction is greater than or equal to 15
  # and a 1 or a 0 (as in TRUE or FALSE) in the ones column for whether the moisture deduction is greater than or equal to 15

  return(c(climatePoints, finalRatingClass))
  }
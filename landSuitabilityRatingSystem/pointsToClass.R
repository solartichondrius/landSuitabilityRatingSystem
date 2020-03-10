# Title     : Points To Class
# Objective : Returns a suitability class from 1 to 7 based on a given number of points from 0 to 100
# Created by: CurtisTh
# Created on: 2020-01-21

pointsToClass <- function(number){

  number[number<10] <- 7
  number[number>=10&number<20] <- 6
  number[number>=20&number<30] <- 5
  number[number>=30&number<45] <- 4
  number[number>=45&number<60] <- 3
  number[number>=60&number<80] <- 2
  number[number>=80] <- 1

  return(number)

}

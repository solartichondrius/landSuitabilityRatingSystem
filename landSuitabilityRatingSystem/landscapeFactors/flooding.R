# Title     : Flooding
# Objective : Calculate the percent deduction related to frequency and duration of flooding
# Created by: CurtisTh
# Created on: 2020-01-21

flooding <- function(inundationPeriod,usableGrowingSeasonLength,frenquency){

  if(frequency < 5){
    if(inundationPeriod < 2){
      percentDeduction <- 0
    } else if(inundationPeriod <= 28){
      percentDeduction <- 5
    } else {
      percentDeduction <- 10
    }
  } else if(frequency <= 25){
    if(inundationPeriod < 2){
      percentDeduction <- 0
    } else if(inundationPeriod <= 7){
      percentDeduction <- 5
    } else if(inundationPeriod <= 28){
      percentDeduction <- 10
    } else {
      percentDeduction <- 20
    }
  } else if(frequency < 50){
    if(inundationPeriod < 2){
      percentDeduction <- 10
    } else if(inundationPeriod <= 7){
      percentDeduction <- 30
    } else if(inundationPeriod <= 28){
      percentDeduction <- 65
    } else {
      percentDeduction <- 75
    }
  } else {
    if(inundationPeriod < 2){
      percentDeduction <- 30
    } else if(inundationPeriod <= 7){
      percentDeduction <- 65
    } else if(inundationPeriod <= 28){
      percentDeduction <- 70
    } else {
      if(usableGrowingSeasonLength > 5){
        percentDeduction <- 85
      } else {
        percentDeduction <- 95
      }
    }
  }

  return(percentDeduction)

}
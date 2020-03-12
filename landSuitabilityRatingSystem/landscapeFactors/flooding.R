# Title     : Flooding
# Objective : Calculate the percent deduction related to frequency and duration of flooding
# Created by: CurtisTh
# Created on: 2020-01-21

flooding <- function(cropType, inundationPeriod, usableGrowingSeasonLength, frequency){

  pointDeduction <- frequency
  if(cropType=="SSSG"){
    #when the frequency is less than 5% and the inundation period is less than 2 days, the percent deduction is 0.
    pointDeduction[frequency<5 & inundationPeriod<2] <- 0
    #when the frequency is less than 5% and the inundation period is between 2 days and 28 days the percent deduction is 5
    pointDeduction[frequency<5 & inundationPeriod<=28 & inundationPeriod>=2] <- 5
    #when the frequency is less than 5% and the inundation period is more than 28 days the percent deduction is 10
    pointDeduction[frequency<5 & inundationPeriod>28] <- 10
    #when the frequency is between 5% and 25% and the inundation period is less than 2 days the percent deduction is 0
    pointDeduction[frequency>=5 & frequency<=25 & inundationPeriod<2] <- 0
    #when the frequency is between 5% and 25% and the inundation period is between 2 and 7 days the percent deduction is 5
    pointDeduction[frequency>=5 & frequency<=25 & inundationPeriod>=2 & inundationPeriod<=7] <- 5
    #when the frequency is between 5% and 25% and the inundation period is between 7 and 28 days the percent deduction is 10
    pointDeduction[frequency>=5 & frequency<=25 & inundationPeriod>7 & inundationPeriod<=28] <- 10
    #when the frequency is between 5% and 25% and the inundation period is greater than 28 days the percent deduction is 20
    pointDeduction[frequency>=5 & frequency<=25 & inundationPeriod>28] <- 20
    #when the frequency is between 25% and 50% and the inundation period is less than 2 days the percent deduction is 10
    pointDeduction[frequency>25 & frequency<50 & inundationPeriod<2] <- 10
    #when the frequency is between 25% and 50% and the inundation period is between 2 and 7 days the percent deduction is 30
    pointDeduction[frequency>25 & frequency<50 & inundationPeriod>=2 & inundationPeriod<=7] <- 30
    #when the frequency is between 25% and 50% and the inundation period is between 7 and 28 days the percent deduction is 65
    pointDeduction[frequency>25 & frequency<50 & inundationPeriod>7 & inundationPeriod<=28] <- 65
    #when the frequency is between 25% and 50% and the inundation period is greater than 28 days the percent deduction is 75
    pointDeduction[frequency>25 & frequency<50 & inundationPeriod>28] <- 75
    #when the frequency is 50% or more and the inundation period is less than 2 days the percent deduction is 30
    pointDeduction[frequency>=50 & inundationPeriod<2] <- 30
    #when the frequency is 50% or more and the inundation period is between 2 and 7 days the percent deduction is 65
    pointDeduction[frequency>=50 & inundationPeriod>=2 & inundationPeriod<=7] <- 65
    #when the frequency is 50% or more and the inundation period is between 7 and 28 days the percent deduction is 70
    pointDeduction[frequency>=50 & inundationPeriod>7 & inundationPeriod<=28] <- 70
    #when the frequency is 50% or more and the inundation period is greater than 28 days
    #and the usable growing season length is 5 weeks or more the percent deduction is 85
    pointDeduction[frequency>=50 & inundationPeriod>28 & usableGrowingSeasonLength>=5] <- 85
    #when the frequency is 50% or more and the inundation period is greater than 28 days
    #and the usable growing season length is less than 5 weeks the percent deduction is 95
    pointDeduction[frequency>=50 & inundationPeriod>28 & usableGrowingSeasonLength<5] <- 95
  }
  #Prevent negative deductions and deductions greater than 100 percent
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100

  return(pointDeduction)
}
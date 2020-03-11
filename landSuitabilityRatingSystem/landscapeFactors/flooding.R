# Title     : Flooding
# Objective : Calculate the percent deduction related to frequency and duration of flooding
# Created by: CurtisTh
# Created on: 2020-01-21

flooding <- function(cropType, inundation, ugsl, floodFreq){
#This information would be specified manually. See LSRS manual. See table below. Is not currently part of the Agrasid database.
  #combine the 3 variables into one 6 digit integer with 2 digits representing each variable
  pd <- ugsl * 10000 + inundation * 100 + floodFreq
  if(cropType=="SSSG"){
    #when the frequency is less than 5% and the inundation period is less than 2 days, the percent deduction is 0.
    pd[pd>10000&pd%%100<5&floor((pd/100)%%100)<2] <- 0
    #when the frequency is less than 5% and the inundation period is between 2 days and 28 days the percent deduction is 5
    pd[pd>10000&pd%%100<5&floor((pd/100)%%100)<=28&floor((pd/100)%%100)>=2] <- 5
    #when the frequency is less than 5% and the inundation period is more than 28 days the percent deduction is 10
    pd[pd>10000&pd%%100<5&floor((pd/100)%%100)>10] <- 10
    #when the frequency is between 5% and 25% and the inundation period is less than 2 days the percent deduction is 0
    pd[pd>10000&pd%%100>=5&pd%%100<=25&floor((pd/100)%%100)<2] <- 0
    #when the frequency is between 5% and 25% and the inundation period is between 2 and 7 days the percent deduction is 5
    pd[pd>10000&pd%%100>=5&pd%%100<=25&floor((pd/100)%%100)>=2&floor((pd/100)%%100)<=7] <- 5
    #when the frequency is between 5% and 25% and the inundation period is between 7 and 28 days the percent deduction is 10
    pd[pd>10000&pd%%100>=5&pd%%100<=25&floor((pd/100)%%100)>7&floor((pd/100)%%100)<=28] <- 10
    #when the frequency is between 5% and 25% and the inundation period is greater than 28 days the percent deduction is 20
    pd[pd>10000&pd%%100>=5&pd%%100<=25&floor((pd/100)%%100)>28] <- 20
    #when the frequency is between 25% and 50% and the inundation period is less than 2 days the percent deduction is 10
    pd[pd>10000&pd%%100>25&pd%%100<50&floor((pd/100)%%100)<2] <- 10
    #when the frequency is between 25% and 50% and the inundation period is between 2 and 7 days the percent deduction is 30
    pd[pd>10000&pd%%100>25&pd%%100<50&floor((pd/100)%%100)>=2&floor((pd/100)%%100)<=7] <- 30
    #when the frequency is between 25% and 50% and the inundation period is between 7 and 28 days the percent deduction is 65
    pd[pd>10000&pd%%100>25&pd%%100<50&floor((pd/100)%%100)>7&floor((pd/100)%%100)<=28] <- 65
    #when the frequency is between 25% and 50% and the inundation period is greater than 28 days the percent deduction is 75
    pd[pd>10000&pd%%100>25&pd%%100<50&floor((pd/100)%%100)>28] <- 75
    #when the frequency is 50% or more and the inundation period is less than 2 days the percent deduction is 30
    pd[pd>10000&pd%%100>=50&floor((pd/100)%%100)<2] <- 30
    #when the frequency is 50% or more and the inundation period is between 2 and 7 days the percent deduction is 65
    pd[pd>10000&pd%%100>=50&floor((pd/100)%%100)>=2&floor((pd/100)%%100)<=7] <- 65
    #when the frequency is 50% or more and the inundation period is between 7 and 28 days the percent deduction is 70
    pd[pd>10000&pd%%100>=50&floor((pd/100)%%100)>7&floor((pd/100)%%100)<=28] <- 70
    #when the frequency is 50% or more and the inundation period is greater than 28 days
    #and the usable growing season length is 5 weeks or more the percent deduction is 85
    pd[pd>10000&pd%%100>=50&floor((pd/100)%%100)>28&floor(pd/10000)>=5] <- 85
    #when the frequency is 50% or more and the inundation period is greater than 28 days
    #and the usable growing season length is less than 5 weeks the percent deduction is 95
    pd[pd>10000&pd%%100>=50&floor((pd/100)%%100)>28&floor(pd/10000)<5] <- 95
  }
  #Prevent negative deductions and deductions greater than 100 percent
  pd[pd<0] <- 0
  pd[pd>100] <- 100

  return(pd)
}
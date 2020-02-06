# Title     : Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-27

results <- function(climateIN=NA,climateOUT=NA,landscapeIN=NA,landscapeOUT=NA,soilIN=NA,soilOUT=NA){

  if(is.na(climateIN)){
    return
  } else {
    if(length(climateIN)==1){
      climateDF <- read.csv(climateIN)
    } else {
      climateDF <- climateRaster(climateIN[1],climateIN[2],climateIN[3],climateIN[4],climateIN[5])
    }
    climateResults(climateDF,climateOUT)
  }

  if(is.na(landscapeIN)){
    return
  } else {
    if(length(landscapeIN)==1){
      landscapeDF <- read.csv(landscapeIN)
    } else {
      landscapeDF <- landscapeRaster(landscapeIN[1],landscapeIN[2],landscapeIN[3],landscapeIN[4],landscapeIN[5])
    }
    landscapeResults(landscapeDF,landscapeOUT)
  }
  #soilResults(input,output) #not finished yet
}

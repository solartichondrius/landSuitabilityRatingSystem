# Title     : Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-27

results <- function(dataType,fileType,input,output){

  if(dataType=="Climate"){
    if(fileType=="Vector"){
      climateDF <- read.csv(input)
    } else {
      climateDF <- climateRaster(input[1],input[2],input[3],input[4],input[5])
    }
    climateResults(climateDF,output)
  }

  if(dataType=="Landscape"){
    if(fileType=="Vector"){
      landscapeDF <- read.csv(input)
    } else {
      landscapeDF <- landscapeRaster(input[1],input[2],input[3],input[4],input[5],input[6],input[7],input[8],input[9],input[10])
    }
    landscapeResults(landscapeDF,output)
  }

  if(dataType=="Soil"){
    if(fileType=="Vector"){
      soilDF <- read.csv(input)
    } else {
      soilDF <- soilRaster(input[1],input[2],input[3],input[4],input[5])
    }
    soilResults(soilDF,output)
  }
}

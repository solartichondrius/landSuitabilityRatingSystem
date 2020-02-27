# Title     : Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-27

results <- function(dataType,fileType,cropType,input,output){

  if(dataType=="Climate"){
    if(fileType=="Vector"){
      climateDF <- read.csv(input)
    } else {
      #climateDF <- climateRaster(input[1],input[2],input[3],input[4],input[5])
      climateR <- raster(input)
      climateR <- stack(climateR)
      climateDF <- as.data.frame(climateR, na.rm=TRUE)
      names(climateDF)[1] <- "ppe"
      names(climateDF)[2] <- "esm"
      names(climateDF)[3] <- "efm"
      names(climateDF)[4] <- "egdd"
      names(climateDF)[5] <- "eff"
    }
    climateResults(climateDF,output)
  }

  if(dataType=="Landscape"){
    if(fileType=="Vector"){
      landscapeDF <- read.csv(input)
    } else {
      #landscapeDF <- landscapeRaster(input[1],input[2],input[3],input[4],input[5],input[6],input[7],input[8],input[9],input[10])
      landscapeR <- raster(input)
      landscapeR <- stack(landscapeR)
      landscapeDF <- as.data.frame(landscapeR, na.rm=TRUE)
      names(landscapeDF)[1] <- "region"
      names(landscapeDF)[2] <- "percentSlope"
      names(landscapeDF)[3] <- "landscapeType"
      names(landscapeDF)[4] <- "coarseFragments"
      names(landscapeDF)[5] <- "surface"
      names(landscapeDF)[6] <- "subsurface"
      names(landscapeDF)[7] <- "pattern"
      names(landscapeDF)[8] <- "inundationPeriod"
      names(landscapeDF)[9] <- "usableGrowingSeasonLength"
      names(landscapeDF)[10] <- "frequency"
    }
    landscapeResults(landscapeDF,output)
  }

  if(dataType=="Soil"){
    if(fileType=="Vector"){
      soilDF <- read.csv(input)
    } else {
      #soilDF <- soilRaster(input[1],input[2],input[3],input[4],input[5])
      soilR <- raster(input)
      soilR <- stack(soilR)
      soilDF <- as.data.frame(soilR, na.rm=TRUE)
    }
    soilResults(soilDF,output)
  }
}

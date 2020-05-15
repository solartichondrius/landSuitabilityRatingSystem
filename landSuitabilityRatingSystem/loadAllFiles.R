# Title     : Load All Files
# Objective : Run all the scripts in this directory
# Created by: CurtisTh
# Created on: 2020-01-21

mainFolder <- paste0(here(),"/landSuitabilityRatingSystem") #main folder
mainFiles <- list.files(mainFolder,"\\.R$") #files in the main folder
mainFiles <- mainFiles[mainFiles != "lsrsMain.R" & mainFiles != "plotGraphs.R" & mainFiles != "test.R" & mainFiles != "loadAllFiles.R" & mainFiles != "lsrsMainRaster.R"] #files to exclude
mainFiles <- paste(mainFolder,mainFiles,sep="/")

climateFolder <- paste0(mainFolder,"/climaticFactors")
climateFiles <- list.files(climateFolder,"\\.R$")
climateFiles <- paste0(climateFolder,"/",climateFiles)

landscapeFolder <- paste0(mainFolder,"/landscapeFactors")
landscapeFiles <- list.files(landscapeFolder,"\\.R$")
landscapeFiles <- paste0(landscapeFolder,"/",landscapeFiles)

soilFolder <- paste0(mainFolder,"/soilFactors")
soilFiles <- list.files(soilFolder,"\\.R$")
soilFiles <- paste0(soilFolder,"/",soilFiles)

organicSoilFolder <- paste0(mainFolder,"/soilFactors/organicSoil")
organicSoilFiles <- list.files(organicSoilFolder,"\\.R$")
organicSoilFiles <- paste0(organicSoilFolder,"/",organicSoilFiles)

allFiles <- c(mainFiles,climateFiles,landscapeFiles,soilFiles,organicSoilFiles)
for(file in allFiles) source(file)
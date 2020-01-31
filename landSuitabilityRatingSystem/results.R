# Title     : Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-27

results <- function(input,output){
  #Load the files with the functions we will be using:
  loadFiles("climaticFactors/climateResults.R","landscapeFactors/landscapeResults.R","soilFactors/soilResults.R")

  climateResults(input,output)
  #landscapeResults(input,output) #not finished yet
  #soilResults(input,output) #not finished yet
}

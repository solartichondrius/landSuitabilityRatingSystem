# Title     : Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-27

results <- function(...,output){
  input <- c(...)
  if(length(input)==1){
    df <- read.csv(input[1])
  } else {
    df <- climateRaster(input[1],input[2],input[3],input[4],input[5])
  }
  climateResults(df,output)
  #landscapeResults(input,output) #not finished yet
  #soilResults(input,output) #not finished yet
}

# Title     : CSV Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-21

csvResults <- function(input,output){
  df <- read.csv(input) #put the data from the CSV file into a dataframe
  for(i in 1:nrow(df)){ #loop through every row and assign a value to the climate rating class
    df$climateRating[i] <- climateRatingClass(df$ppe[i],df$esm[i],df$efm[i],df$egdd[i],df$eff[i])
  }
  write.csv(df,output) #write the dataframe to a file
}
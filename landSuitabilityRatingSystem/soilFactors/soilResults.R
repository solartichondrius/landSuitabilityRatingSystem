# Title     : Soil Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-27

soilResults <- function(input,output,save=TRUE){
  df <- read.csv(input) #put the data from the CSV file into a dataframe
  for(i in 1:nrow(df)){ #loop through every row and assign a value to the soil rating class
    #df$soilRating[i] <- soilRatingClass(df$region[i],df$percentSlope[i],df$landscapeType[i],df$annualRemoval[i],df$coarseFragments[i],df$woodContent[i],df$pattern[i],df$flooding[i])
  } #values are just placeholders for now since I don't have any soil data to work with yet so I don't know what all the columns and their names will be yet
  if(save==TRUE){ #if the save argument is set to TRUE (which it is by default)
    write.csv(df,output) #then write the dataframe to a file
  } else { #if the save argument is set to false
    return(df) #simply return the dataframe that was just created
  }
}
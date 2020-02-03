# Title     : Climate Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-27

climateResults <- function(input,output,save=TRUE){

  df <- read.csv(input) #put the data from the CSV file into a dataframe
  for(i in 1:nrow(df)){ #loop through every row and assign a value to the climate rating class
    results <- climateRating(df$ppe[i],df$esm[i],df$efm[i],df$egdd[i],df$eff[i])
    df$moisturePointDeduction[i] <- results[3]
    df$temperaturePointDeduction[i] <- results[4]
    df$basicClimateRating[i] <- results[5]
    df$springMoisturePercentDeduction[i] <- results[6]
    df$fallMoisturePercentDeduction[i] <- results[7]
    df$fallFrostPercentDeduction[i] <- results[8]
    df$finalRatingPoints[i] <- results [2]
    df$climateRatingClass[i] <- results[1]
    print(paste0(i/nrow(df)*100,"% complete")) #print out the current progress as a percentage
  }
  if(save==TRUE){ #if the save argument is set to TRUE (which it is by default)
    write.csv(df,output) #then write the dataframe to a file
  } else { #if the save argument is set to false
    return(df) #simply return the dataframe that was just created
  }
}
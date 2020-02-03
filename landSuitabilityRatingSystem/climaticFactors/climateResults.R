# Title     : Climate Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-27

climateResults <- function(input,output,save=TRUE){

  df <- read.csv(input) #put the data from the CSV file into a dataframe
  percent <- 0 #percent completion of this program, starting at 0 and going to 100
  for(i in 1:nrow(df)){ #loop through every row and assign a value to the climate rating class
    results <- climateRating(df$ppe[i],df$esm[i],df$efm[i],df$egdd[i],df$eff[i]) #put the values from the loaded file into the climate rating function to calculate the results
    df$moisturePointDeduction[i] <- results[3]
    df$temperaturePointDeduction[i] <- results[4]
    df$basicClimateRating[i] <- results[5]
    df$springMoisturePercentDeduction[i] <- results[6]
    df$fallMoisturePercentDeduction[i] <- results[7]
    df$fallFrostPercentDeduction[i] <- results[8]
    df$finalRatingPoints[i] <- results [2]
    df$climateRatingClass[i] <- results[1]
    if(percent != floor(i/nrow(df)*100)){ #only update the percent progress if the new percent is not the same as the old percent (so it will only display a maximum of 100 lines rather than one for every single row in the dataframe
      percent <- floor(i/nrow(df)*100) #calculate the percent progress which is the current row divided by all rows times 100
      print(paste0(percent,"% complete")) #print out the current progress as a percentage
    }
  }
  if(save==TRUE){ #if the save argument is set to TRUE (which it is by default)
    write.csv(df,output) #then write the dataframe to a file
  } else { #if the save argument is set to false
    return(df) #simply return the dataframe that was just created
  }
}
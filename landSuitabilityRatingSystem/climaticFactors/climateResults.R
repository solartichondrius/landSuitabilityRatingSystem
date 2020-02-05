# Title     : Climate Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-27

climateResults <- function(df,output,save=TRUE){

  for(i in 1:nrow(df)){ #loop through every row and assign a value to the climate rating class
    results <- climateRating(df$ppe[i],df$esm[i],df$efm[i],df$egdd[i],df$eff[i]) #put the values from the loaded file into the climate rating function to calculate the results
    df$moisturePointDeduction[i] <- results[3] #point deduction for moisture
    df$temperaturePointDeduction[i] <- results[4] #point deduction for temperature
    df$basicClimateRating[i] <- results[5] #basic climate rating score
    df$springMoisturePercentDeduction[i] <- results[6] #percent deduction for excess spring moisture
    df$fallMoisturePercentDeduction[i] <- results[7] #percent deduction for excess fall moisture
    df$fallFrostPercentDeduction[i] <- results[8] #percent deduction for early fall frost
    df$finalRatingPoints[i] <- results[2] #final rating points for climate
    df$climateRatingClass[i] <- results[1] #final rating class for climate
    print(paste(i,"out of",nrow(df),"completed"))
  }
  if(save==TRUE){ #if the save argument is set to TRUE (which it is by default)
    write.csv(df,output) #then write the dataframe to a file
  } else { #if the save argument is set to false
    return(df) #simply return the dataframe that was just created
  }
}
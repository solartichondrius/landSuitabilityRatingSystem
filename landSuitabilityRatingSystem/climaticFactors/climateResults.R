# Title     : Climate Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-27

climateResults <- function(df,output,save=TRUE){

  #df <- df[sample(nrow(df),1000),] #for testing a small sample of a large dataset
  df$rowNumber <- 1:nrow(df)
  size <- nrow(df)

  results <- apply(df,1,function(row) {
    results <- climateRating(row["ppe"],row["esm"],row["efm"],row["egdd"],row["eff"])
    print(paste(row["rowNumber"],"out of",size,"completed"))
    results
  })

  df["climateRatingPoints"] <- results[1,]
  df["climateRatingClass"] <- results[2,]
  df <- subset(df,select=-c(rowNumber))

  if(save==TRUE){ #if the save argument is set to TRUE (which it is by default)
    write.csv(df,output) #then write the dataframe to a file
  } else { #if the save argument is set to false
    return(df) #simply return the dataframe that was just created
  }
}
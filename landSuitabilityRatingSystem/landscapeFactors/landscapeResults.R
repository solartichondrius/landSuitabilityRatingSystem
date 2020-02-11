# Title     : Landscape Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-27

landscapeResults <- function(df,output,save=TRUE){ #takes dataframe as input, and outputs results either as a dataframe or to a file depending on the boolean value "save" (TRUE by default)

  #df <- df[sample(nrow(df),1000),] #for testing a small sample of a large dataset
  df$rowNumber <- 1:nrow(df) #add column to number every row in the dataframe
  size <- nrow(df) #save the size (number of rows) of the dataframe

  results <- apply(df,1,function(row) { #apply the following code to every row in the dataframe
    results <- landscapeRating(as.numeric(row["region"]),as.numeric(row["ps"]),row["lt"],as.numeric(row["cf"]),
                               as.numeric(row["surface"]),as.numeric(row["subsurface"]),as.numeric(row["pattern"]),
                               as.numeric(row["inundationPeriod"]),as.numeric(row["usableGrowingSeasonLength"]),
                               as.numeric(row["frequency"])) #save the results of the climate rating function applied to the relevant columns of the dataframe
    print(paste(row["rowNumber"],"out of",size,"completed")) #print the progress to the server
    incProgress(1/size*1,detail=(paste(row["rowNumber"],"out of",size,"completed"))) #print the progress to the website
    results #return the results
  })

  df["landscapeRatingPoints"] <- results[1,] #create column for climate rating points
  df["landscapeRatingClass"] <- results[2,] #create column for climate rating class
  df <- subset(df,select=-c(rowNumber)) #remove the column numbering the rows

  if(save==TRUE){ #if the save argument is set to TRUE (which it is by default)
    write.csv(df,output) #then write the dataframe to a file
  } else { #if the save argument is set to false
    return(df) #simply return the dataframe that was just created
  }
}
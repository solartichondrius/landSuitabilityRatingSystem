# Title     : Climate Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-27

climateResults <- function(fileType, cropType, input, output, printProgress=FALSE) { #takes dataframe as input, and outputs results either as a dataframe or to a file depending on the boolean value "save" (TRUE by default)

  if (fileType == "Vector") { #if the file type is a vector

    df <- read.csv(input) #read the file into a data frame
    df$rowNumber <- 1:nrow(df) #add column to number every row in the dataframe
    size <- nrow(df) #save the size (number of rows) of the dataframe

    results <- apply(df, 1, function(row) { #apply the following code to every row in the dataframe
      results <- climateRatingClass(cropType, row["ppe"], row["esm"], row["efm"], row["egdd"], row["eff"]) #save the results of the climate rating function applied to the relevant columns of the dataframe
      #print(paste(row["rowNumber"],"out of",size,"completed")) #print the progress to the server
      incProgress(1/size, detail = (paste(row["rowNumber"], "out of", size, "completed"))) #print the progress to the website
      results #return the results
    })

    df["climateRatingPoints"] <- results[1] #add the results to a new column in the data frame called "climateRating"
    df["climateRatingClass"] <- results[2]
    df <- subset(df, select = -c(rowNumber)) #remove the column numbering the rows
    write.csv(df, output) #write the dataframe to a csv file

  } else { #if the input is a raster
    ppe <- raster(input[1])
    esm <- raster(input[2])
    efm <- raster(input[3])
    egdd <- raster(input[4])
    eff <- raster(input[5])
    results <- climateRatingClass(cropType, ppe, esm, efm, egdd, eff, printProgress)
    climatePoints <- results[[1]]
    climateClass <- results[[2]]
    climateRaster <- stack(ppe, esm, efm, egdd, eff, climatePoints, climateClass)
    writeRaster(climateRaster, output)
  }
}
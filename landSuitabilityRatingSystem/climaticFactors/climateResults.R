# Title     : Climate Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-27

climateResults <- function(fileType, cropType, input, output) { #takes dataframe as input, and outputs results either as a dataframe or to a file depending on the boolean value "save" (TRUE by default)

  if (fileType == "Vector") { #if the file type is a vector

    df <- read.csv(input) #read the file into a data frame

    results <- apply(df, 1, function(row) { #apply the following code to every row in the dataframe
      results <- climateRatingClass(row["ppe"], row["esm"], row["efm"], row["egdd"]) #save the results of the climate rating function applied to the relevant columns of the dataframe
      results #return the results
    })

    df["climateRating"] <- results
    write.csv(df, output) #write the dataframe to a csv file

  } else { #if the input is a raster
    ppe <- raster(input[1])
    esm <- raster(input[2])
    efm <- raster(input[3])
    egdd <- raster(input[4])
    #eff <- raster(input[5])
    results <- climateRatingClass(ppe, esm, efm, egdd)
    writeRaster(results, output)
  }
}
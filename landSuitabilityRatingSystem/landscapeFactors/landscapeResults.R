# Title     : Landscape Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-27

landscapeResults <- function(fileType, cropType, input, output, printProgress=FALSE) { #takes dataframe as input, and outputs results either as a dataframe or to a file depending on the boolean value "save" (TRUE by default)

  if (fileType == "Vector") { #if the file type is a vector

    df <- read.csv(input) #read the file into a data frame
    df$rowNumber <- 1:nrow(df) #add column to number every row in the dataframe
    size <- nrow(df) #save the size (number of rows) of the dataframe

    results <- apply(df, 1, function(row) { #apply the following code to every row in the dataframe
      results <- landscapeNumbersToLetters(landscapeRatingClass(cropType, as.numeric(row["region"]), as.numeric(row["ps"]), as.numeric(row["lt"]), as.numeric(row["cf"]),
                                 as.numeric(row["surface"]), as.numeric(row["subsurface"]), as.numeric(row["pattern"]),
                                 as.numeric(row["inundationPeriod"]), as.numeric(row["usableGrowingSeasonLength"]),
                                 as.numeric(row["frequency"]))) #save the results of the climate rating function applied to the relevant columns of the dataframe
      #print(paste(row["rowNumber"],"out of",size,"completed")) #print the progress to the server
      incProgress(1/size, detail = (paste(row["rowNumber"], "out of", size, "completed"))) #print the progress to the website
      results #return the results
    })

    df["landscapeRating"] <- results #add the results to a new column in the data frame called "landscapeRating"
    df <- subset(df, select = -c(rowNumber)) #remove the column numbering the rows
    write.csv(df, output) #write the dataframe to a csv file

  } else { #if the input is a raster
    if(printProgress) incProgress(0.1, detail = ("loading raster files")) #print the progress to the website
    #region <- raster(input[1])
    ps <- raster(input[1])
    lsFactor <- raster(input[2])
    # cf <- raster(input[4])
    # surface <- raster(input[5])
    # subsurface <- raster(input[6])
    # pattern <- raster(input[7])
    # inundationPeriod <- raster(input[8])
    # usableGrowingSeasonLength <- raster(input[9])
    # frequency <- raster(input[10])
    #results <- landscapeRatingClass(cropType, region,ps,lt,cf,surface,subsurface,pattern,inundationPeriod,usableGrowingSeasonLength,frequency,printProgress)
    #For current data only.
    ps <- ps * 10
    results <- landscapeRatingClass(cropType, ps, lsFactor, printProgress)
    #Create output file by combining all raster files into a stack.
    landscapePoints <- results[[1]]
    landscapeClass <- results[[2]]
    # landscapeRaster <- stack(region,ps,lt,cf,surface,subsurface,pattern,
    #                          inundationPeriod,usableGrowingSeasonLength,
    #                          frequency,landscapePoints,landscapeClass)
    landscapeRaster <- stack(ps, lsFactor, landscapePoints, landscapeClass)
    writeRaster(landscapeRaster, output)
  }
}
# Title     : Soil Results
# Objective : Calculate the results using input from a CSV file then save to a new CSV file
# Created by: CurtisTh
# Created on: 2020-01-27

soilResults <- function(fileType, cropType, input, output, printProgress=FALSE) { #takes dataframe as input, and outputs results either as a dataframe or to a file depending on the boolean value "save" (TRUE by default)

  if (fileType == "Vector") { #if the file type is a vector

    df <- read.csv(input) #read the file into a data frame
    df$rowNumber <- 1:nrow(df) #add column to number every row in the dataframe
    size <- nrow(df) #save the size (number of rows) of the dataframe

    results <- apply(df, 1, function(row) { #apply the following code to every row in the dataframe
      results <- soilNumbersToLetters(soilRatingClass(cropType,row["soilType"],row["claySurface"],row["claySubsurface"],row["sandSurface"],row["sandSubsurface"],row["siltSurface"],row["siltSubsurface"],
      row["cfSurface]"],row["cfSubsurface"],row["awhcSurface"],row["awhcSubsurface"],row["ppe"],row["ocSurfacePerc"],row["surfacePH"],row["subsurfacePH"],row["surfaceEC"],row["subsurfaceEC"],
                                                      row["sarSurface"],row["sarSubsurface"],row["E_DEPTH"],row["bd"],row["EGDD"]))
      #print(paste(row["rowNumber"],"out of",size,"completed")) #print the progress to the server
      incProgress(1/size, detail = (paste(row["rowNumber"], "out of", size, "completed"))) #print the progress to the website
      results #return the results
    })

    df["soilRating"] <- results #add the results to a new column in the data frame called "climateRating"
    df <- subset(df, select = -c(rowNumber)) #remove the column numbering the rows
    write.csv(df, output) #write the dataframe to a csv file

  } else { #if the input is a raster
    if(printProgress) incProgress(0.05, detail = ("loading raster files")) #print the progress to the website
    soilType <- raster(input[1])
    claySurface <- raster(input[2])
    claySubsurface <- raster(input[3])
    siltSurface <- raster(input[4])
    siltSubsurface <- raster(input[5])
    cfSurface <- raster(input[6])
    cfSubsurface <- raster(input[7])
    ppe <- raster(input[8])
    ocSurfacePerc <- raster(input[9])
    surfacePH <- raster(input[10])
    subsurfacePH <- raster(input[11])
    surfaceEC <- raster(input[12])
    subsurfaceEC <- raster(input[13])
    results <- soilRatingClass(cropType, soilType, claySurface, claySubsurface, siltSurface, 
                               siltSubsurface, cfSurface, cfSubsurface, ppe, ocSurfacePerc, 
                               surfacePH, subsurfacePH, surfaceEC, subsurfaceEC, printProgress)
    writeRaster(results, output)
  }
}
# Title     : Load Raster
# Objective : Load Raster File into a Data Frame
# Created by: CurtisTh
# Created on: 2020-02-04

loadRaster <- function(rasterFile){ #takes a raster file as an argument
  library(raster) #load the raster library
  rasterAsDF <- as.data.frame(raster(rasterFile)) #create data frame created from raster
  return(rasterAsDF) #return the dataframe
}
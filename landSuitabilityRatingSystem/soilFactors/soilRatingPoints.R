# Title     : Soil Rating Points
# Objective : Calculate the soil rating
# Created by: CurtisTh
# Created on: 2020-01-22

soilRatingPoints <- function(awhcSurface, awhcSubsurface, ppe, surfaceClass,
                             subsurfaceClass){
  
  surfaceTexture <- surfaceMoisture(awhcSurface, ppe)
  subsurfaceTexture <- subsurfaceMoisture(surfaceClass, subsurfaceClass)

  M <- surfaceTexture + subsurfaceTexture
  
  #Create a new table containing all columns from slTable
  #and the new columns for point calculations.
  slRatingTable <- slTable
  slRatingTable$m <- M
  
  return(slRatingTable)
}
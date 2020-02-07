# Title     : Soil Rating Points
# Objective : Calculate the soil rating
# Created by: CurtisTh
# Created on: 2020-01-22

soilRatingPoints <- function(awhcSurface, awhcSubsurface, ppe, ocSurfacePerc,
                             surfacePH, surfaceEC){
  
  #Create a new table containing all relevant columns from slTable
  #and the new columns for point calculations.
  slRatingTable <- slTable[c("Value", "POLY_ID", "awhcSurface", 
                             "awhcSubsurface", "ppe", "ocSurfacePerc", 
                             "surfacePH", "surfaceEC")]
  #Water Retention Factor
  for (i in 1:length(slRatingTable$POLY_ID)) {
    surface <- slRatingTable$awhcSurface[i]
    slRatingTable$surfaceClass[i] <- awhcClass(surface)
    subsurface <- slRatingTable$awhcSubsurface[i]
    slRatingTable$subsurfaceClass[i] <- awhcClass(subsurface)
  }
  surfaceTexture <- surfaceMoisture(awhcSurface, ppe)
  subsurfaceTexture <- subsurfaceMoisture(slRatingTable$surfaceClass, 
                                          slRatingTable$subsurfaceClass)
  #Subtotal texture deductions (M)
  m <- surfaceTexture + subsurfaceTexture
  #Surface Factors
  #Structure and consistency deductions (D)
  #Organic matter deductions (F)
  f <- organicMatterContent(ocSurfacePerc)
  #Topsoil depth deductions (E)
  #Reaction (V)
  v <- reaction(surfacePH)
  #Salinity (N)
  n <- salinity(surfaceEC)
  #Sodicity (Y)
  #Chemistry deduction (c)
  #c <- max(v, n, y)
  #Organic surfaces (O)
  #Total surface deduction
  #surfaceDeduction <- d + f + e + c + o
  #Preliminary Soil Rating
  #prelimRating <- 100 - m - surfaceDeduction
  
  slRatingTable$m <- m
  slRatingTable$f <- f
  slRatingTable$v <- v
  slRatingTable$n <- n
  
  #Replace all negative values in the organic matter deduction 
  #column with 0 and all values above 15 with 15.
  slRatingTable$f <- with(slRatingTable, replace(f, f < 0, 0))
  slRatingTable$f <- with(slRatingTable, replace(f, f > 15, 15))
  slRatingTable$v <- with(slRatingTable, replace(v, v < 0, 0))
  slRatingTable$v <- with(slRatingTable, replace(v, v > 100, 100))
  #slRatingTable$n <- with(slRatingTable, replace(n, n < 0, 0))
  #slRatingTable$n <- with(slRatingTable, replace(n, n > 100, 100))
  
  return(slRatingTable)
}
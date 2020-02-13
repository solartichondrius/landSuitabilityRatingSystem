# Title     : Soil Rating Points
# Objective : Calculate the soil rating
# Created by: CurtisTh
# Created on: 2020-01-22

soilRatingPoints <- function(claySurface, claySubsurface,
                             sandSurface, sandSubsurface,
                             siltSurface, siltSubsurface,
                             cfSurface, cfSubsurface, 
                             awhcSurface, awhcSubsurface, ppe, ocSurfacePerc,
                             ocSubsurfacePerc, surfacePH, subsurfacePH, 
                             surfaceEC, subsurfaceEC, 
                             sarSurface, sarSubsurface, E_DEPTH, bd){
  
  #Create a new table containing all relevant columns from slTable
  #and the new columns for point calculations.
  slRatingTable <- slTable[c("Value", "POLY_ID", 
                             "claySurface", "claySubsurface",
                             "sandSurface", "sandSubsurface",
                             "siltSurface", "siltSubsurface", 
                             "cfSurface", "cfSubsurface", "awhcSurface", 
                             "awhcSubsurface", "ppe", "ocSurfacePerc",
                             "ocSubsurfacePerc", "surfacePH", "subsurfacePH",
                             "surfaceEC", "subsurfaceEC",
                             "sarSurface", "sarSubsurface", 
                             "E_DEPTH", "bd")]
  
  #Surface AWHC deduction
  subtotalTextureDeduction <- moisture(siltSurface, siltSubsurface, 
                                              claySurface, claySubsurface, 
                                              cfSurface, cfSubsurface, 
                                              awhcSurface, ppe)
  #Subsurface texture deduction
  #subsurfaceTexture <- subsurfaceMoisture()
  #Water table deduction
  #wt <- waterTable(waterTableDepth, claySurface, siltSurface)
  #wtDeduction <- (wt / 100) * subtotalTextureDeduction 
  #Subtotal texture deductions (M)
  m <- subtotalTextureDeduction #- wtDeduction
  #Surface Factors
  #Structure and consistency deductions (D)
  #d <- surfaceStructure(claySurface, siltSurface, o)
  #Organic matter deductions (F)
  f <- organicMatterContent(ocSurfacePerc)
  #Topsoil depth deductions (E)
  #e <- topsoil(topsoilDepth)
  #Reaction (V)
  v <- reaction(surfacePH)
  #Salinity (N)
  n <- salinity(surfaceEC)
  #Sodicity (Y)
  #sarSurface <- ksatSurface / 10
  y <- sodicity(sarSurface)
  #Chemistry deduction (c)
  c <- chemistry(v, n, y)
  #Organic surfaces (O)
  slRatingTable$bd <- with(slRatingTable, replace(bd, bd == 0, 0.12))
  o <- organicSurface(E_DEPTH, bd)
  #Total surface deduction (d)
  #surfaceDeduction <- d + f + e + c + o
  #Preliminary Soil Rating
  #prelimRating <- 100 - m - surfaceDeduction
  
  #Subsurface Factors
  #Subsurface impedence (sD)
  #Impedence modification
  #Chemistry
  #Reaction (sV)
  sv <- reaction(subsurfacePH)
  #Salinity (sN)
  sn <- salinity(subsurfaceEC)
  #Sodicity (sY)
  #sarSubsurface <- ksatSubsurface / 10
  sy <- sodicity(sarSubsurface)
  #Chemistry deduction (sC)
  sc <- chemistry(sv, sn, sy)
  
  slRatingTable$m <- m
  slRatingTable$f <- f
  slRatingTable$v <- v
  slRatingTable$n <- n
  slRatingTable$y <- y
  slRatingTable$c <- ifelse(c > sc, c, sc)
  slRatingTable$o <- o
  slRatingTable$sv <- sv
  slRatingTable$sn <- sn
  slRatingTable$sy <- sy
  
  #Replace all negative values in the organic matter deduction 
  #column with 0 and all values above 15 with 15.
  slRatingTable$f <- with(slRatingTable, replace(f, f < 0, 0))
  slRatingTable$f <- with(slRatingTable, replace(f, f > 15, 15))
  slRatingTable$v <- with(slRatingTable, replace(v, v < 0, 0))
  slRatingTable$v <- with(slRatingTable, replace(v, v > 100, 100))
  slRatingTable$n <- with(slRatingTable, replace(n, n < 0, 0))
  slRatingTable$n <- with(slRatingTable, replace(n, n > 100, 100))
  slRatingTable$y <- with(slRatingTable, replace(y, y < 0, 0))
  slRatingTable$y <- with(slRatingTable, replace(y, y > 100, 100))
  slRatingTable$c <- with(slRatingTable, replace(c, c < 0, 0))
  slRatingTable$c <- with(slRatingTable, replace(c, c > 100, 100))
  slRatingTable$o <- with(slRatingTable, replace(o, o < 0, 0))
  slRatingTable$o <- with(slRatingTable, replace(o, o > 100, 100))
  
  return(slRatingTable)
}
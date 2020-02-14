# Title     : Soil Rating Points
# Objective : Calculate the soil rating
# Created by: CurtisTh
# Created on: 2020-01-22

soilRatingPoints <- function(claySurface, claySubsurface,
                             sandSurface, sandSubsurface,
                             siltSurface, siltSubsurface,
                             cfSurface, cfSubsurface, 
                             awhcSurface, awhcSubsurface, ppe, ocSurfacePerc,
                             surfacePH, subsurfacePH, 
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
                             "surfacePH", "subsurfacePH",
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
  slRatingTable$m <- m
  #Surface Factors
  
  #Organic matter deductions (F)
  f <- organicMatterContent(ocSurfacePerc)
  slRatingTable$f <- f
  slRatingTable$f <- with(slRatingTable, replace(f, f < 0, 0))
  slRatingTable$f <- with(slRatingTable, replace(f, f > 15, 15))
  #Topsoil depth deductions (E)
  #e <- topsoil(topsoilDepth)
  #Reaction (V)
  v <- reaction(surfacePH)
  slRatingTable$v <- v
  slRatingTable$v <- with(slRatingTable, replace(v, v < 0, 0))
  slRatingTable$v <- with(slRatingTable, replace(v, v > 100, 100))
  #Salinity (N)
  n <- salinity(surfaceEC)
  slRatingTable$n <- n
  slRatingTable$n <- with(slRatingTable, replace(n, n < 0, 0))
  slRatingTable$n <- with(slRatingTable, replace(n, n > 100, 100))
  #Sodicity (Y)
  #sarSurface <- ksatSurface / 10
  y <- sodicity(sarSurface)
  slRatingTable$y <- y
  slRatingTable$y <- with(slRatingTable, replace(y, y < 0, 0))
  slRatingTable$y <- with(slRatingTable, replace(y, y > 100, 100))
  #Chemistry deduction (c)
  c <- chemistry(v, n, y)
  slRatingTable$c <- with(slRatingTable, replace(c, c < 0, 0))
  slRatingTable$c <- with(slRatingTable, replace(c, c > 100, 100))
  #Organic surfaces (O)
  # slRatingTable$bd <- with(slRatingTable, replace(bd, bd == 0, 0.12))
  # o <- organicSurface(E_DEPTH, bd)
  # slRatingTable$o <- o
  #Structure and consistency deductions (D)
  d <- surfaceStructure(claySurface, siltSurface, ocSurfacePerc)
  slRatingTable$d <- d
  
  #Subsurface Factors
  #Subsurface impedence (sD)
  #Impedence modification
  #Chemistry
  #Reaction (sV)
  sv <- reaction(subsurfacePH)
  slRatingTable$sv <- sv
  slRatingTable$sv <- with(slRatingTable, replace(sv, sv < 0, 0))
  slRatingTable$sv <- with(slRatingTable, replace(sv, sv > 100, 100))
  #Salinity (sN)
  sn <- salinity(subsurfaceEC)
  slRatingTable$sn <- sn
  slRatingTable$sn <- with(slRatingTable, replace(sn, sn < 0, 0))
  slRatingTable$sn <- with(slRatingTable, replace(sn, sn > 100, 100))
  #Sodicity (sY)
  #sarSubsurface <- ksatSubsurface / 10
  sy <- sodicity(sarSubsurface)
  slRatingTable$sy <- sy
  slRatingTable$sy <- with(slRatingTable, replace(sy, sy < 0, 0))
  slRatingTable$sy <- with(slRatingTable, replace(sy, sy > 100, 100))
  #Chemistry deduction (sC)
  sc <- chemistry(sv, sn, sy)
  c <- ifelse(c > sc, c, sc)
  slRatingTable$c <- c
  #Total surface deduction (d)
  #surfaceDeduction <- d + f + e + c + o
  surfaceDeduction <- d + f + c
  slRatingTable$surfaceDeduction <- surfaceDeduction
  #Preliminary Soil Rating
  prelimRating <- 100 - m - surfaceDeduction
  slRatingTable$prelimRating <- prelimRating
  #Basic Soil Rating (g)
  #basicRating <- prelimRating - sd
  
  #Drainage Factor (W)
  #slRatingTable$claySurface <- with(slRatingTable, replace(claySurface, claySurface == 0, 0.000001))
  #slRatingTable$siltSurface <- with(slRatingTable, replace(siltSurface, siltSurface == 0, 0.000001))
  #w <- drainage(wt, ppe, claySurface, siltSurface)
  
  #Final Soil Rating
  points <- prelimRating# - w
  slRatingTable$points <- points
  
  #slRatingTable$w <- w
  
  #Replace all negative values in the deduction columns with 0 
  #and all values above 100 with 100, except for organic matter content,
  #which has a maximum deduction of 15.
  # slRatingTable$o <- with(slRatingTable, replace(o, o < 0, 0))
  # slRatingTable$o <- with(slRatingTable, replace(o, o > 100, 100))
  
  return(slRatingTable)
}
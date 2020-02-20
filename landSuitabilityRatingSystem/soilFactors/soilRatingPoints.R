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
                             sarSurface, sarSubsurface, E_DEPTH, bd, egdd){
  
  #Create a new table containing all relevant columns from slTable
  #and the new columns for point calculations.
  slRatingTable <- slTable[c("slc", "claySurface", "claySubsurface",
                             "sandSurface", "sandSubsurface",
                             "siltSurface", "siltSubsurface", 
                             "cfSurface", "cfSubsurface", "awhcSurface", 
                             "awhcSubsurface", "ppe", "ocSurfacePerc",
                             "surfacePH", "subsurfacePH",
                             "surfaceEC", "subsurfaceEC",
                             "sarSurface", "sarSubsurface", 
                             "E_DEPTH", "bd", "egdd", "a")]
  
  #Organic Soil Temperature Factor (Z)
  # z <- soilTemperature(egdd)
  # slRatingTable$z <- z
  
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
  #Topsoil depth deductions (E)
  #e <- topsoil(E_DEPTH)
  #Reaction (V)
  v <- reaction(surfacePH)
  slRatingTable$v <- v
  #Salinity (N)
  n <- salinity(surfaceEC)
  slRatingTable$n <- n
  #Sodicity (Y)
  #sarSurface <- ksatSurface / 10
  y <- sodicity(sarSurface)
  slRatingTable$y <- y
  #Chemistry deduction (c)
  c <- chemistry(v, n, y)
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
  #Salinity (sN)
  sn <- salinity(subsurfaceEC)
  slRatingTable$sn <- sn
  #Sodicity (sY)
  #sarSubsurface <- ksatSubsurface / 10
  sy <- sodicity(sarSubsurface)
  slRatingTable$sy <- sy
  #Chemistry deduction (sC)
  sc <- chemistry(sv, sn, sy)
  #Only the largest chemistry deduction is used.
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
  
  return(slRatingTable)
}
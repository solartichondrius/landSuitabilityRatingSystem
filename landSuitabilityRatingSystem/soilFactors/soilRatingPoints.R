# Title     : Soil Rating Points
# Objective : Calculate the point deduction for the mineral soil factor.
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
  #Organic matter deductions (F)
  f <- organicMatterContent(ocSurfacePerc)
  #Topsoil depth deductions (E)
  #e <- topsoil(E_DEPTH)
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
  # slRatingTable$bd <- with(slRatingTable, replace(bd, bd == 0, 0.12))
  # o <- organicSurface(E_DEPTH, bd)
  # slRatingTable$o <- o
  #Structure and consistency deductions (D)
  d <- surfaceStructure(claySurface, siltSurface, ocSurfacePerc)
  
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
  #Only the largest chemistry deduction is used.
  c <- ifelse(c > sc, c, sc)
  #Total surface deduction (d)
  #surfaceDeduction <- d + f + e + c + o
  surfaceDeduction <- d + f + c
  #Preliminary Soil Rating
  prelimRating <- 100 - m - surfaceDeduction
  #Basic Soil Rating (g)
  #basicRating <- prelimRating - sd
  
  #Drainage Factor (W)
  #slRatingTable$claySurface <- with(slRatingTable, replace(claySurface, claySurface == 0, 0.000001))
  #slRatingTable$siltSurface <- with(slRatingTable, replace(siltSurface, siltSurface == 0, 0.000001))
  #w <- drainage(wt, ppe, claySurface, siltSurface)
  
  #Final Soil Rating
  points <- prelimRating# - w
  
  #Create a new table containing all relevant columns from slTable
  #and the new columns for point calculations, which will be used
  #to find the class.
  slRatingTable <- slTable[c("slc", "claySurface", "claySubsurface",
                             "sandSurface", "sandSubsurface",
                             "siltSurface", "siltSubsurface", 
                             "cfSurface", "cfSubsurface", "awhcSurface", 
                             "awhcSubsurface", "ppe", "ocSurfacePerc",
                             "surfacePH", "subsurfacePH",
                             "surfaceEC", "subsurfaceEC",
                             "sarSurface", "sarSubsurface", 
                             "E_DEPTH", "bd", "egdd", "a")]
  slRatingTable$m <- m
  slRatingTable$f <- f
  slRatingTable$v <- v
  slRatingTable$n <- n
  slRatingTable$y <- y
  slRatingTable$d <- d
  slRatingTable$sv <- sv
  slRatingTable$sn <- sn
  slRatingTable$sy <- sy
  slRatingTable$c <- c
  slRatingTable$surfaceDeduction <- surfaceDeduction
  slRatingTable$prelimRating <- prelimRating
  #slRatingTable$w <- w
  slRatingTable$points <- points
  return(slRatingTable)
}
# Title     : Soil Rating Points
# Objective : Calculate the point deduction for the mineral soil factor.
# Created by: CurtisTh
# Created on: 2020-01-22

soilRatingPoints <- function(soilClass, claySurface, claySubsurface,
                             sandSurface, sandSubsurface,
                             siltSurface, siltSubsurface,
                             cfSurface, cfSubsurface, 
                             ppe, ocSurfacePerc,
                             surfacePH, subsurfacePH, 
                             surfaceEC, subsurfaceEC, egdd){
  
  #Water Retention Factor
  #AWHC
  awhc <- capacity(claySurface, siltSurface)
  #Texture deduction
  subtotalTextureDeduction <- moisture(siltSurface, siltSubsurface, 
                                              claySurface, claySubsurface, 
                                              cfSurface, cfSubsurface, ppe)
  #Water table deduction
  #wt <- waterTable(waterTableDepth, claySurface, siltSurface)
  #wtDeduction <- (wt / 100) * subtotalTextureDeduction 
  #Subtotal texture deductions (M)
  m <- subtotalTextureDeduction #- wtDeduction
  
  #Surface Factors
  #Organic matter deductions (F)
  if(printProgress) incProgress(0.05, detail = ("calculating surfaceorganic matter content deduction")) #print the progress to the website
  f <- organicMatterContent(cropType, ocSurfacePerc)
  #Topsoil depth deductions (E)
  #e <- topsoil(E_DEPTH)
  #Reaction (V)
  if(printProgress) incProgress(0.05, detail = ("calculating surface reaction deduction")) #print the progress to the website
  v <- reaction(cropType, surfacePH)
  #Salinity (N)
  if(printProgress) incProgress(0.05, detail = ("calculating surface salinity deduction")) #print the progress to the website
  n <- salinity(cropType, surfaceEC)
  #Sodicity (Y)
  #sarSurface <- ksatSurface / 10
  if(printProgress) incProgress(0.05, detail = ("calculating surface sodicity deduction")) #print the progress to the website
  y <- sodicity(cropType, sarSurface)
  #Chemistry deduction (c)
  c <- max(v, n, y)

  #Organic surfaces (O)
  # slRatingTable$bd <- with(slRatingTable, replace(bd, bd == 0, 0.12))
  # o <- organicSurface(P_DEPTH, bd)
  # slRatingTable$o <- o
  #Structure and consistency deductions (D)
  #if(printProgress) incProgress(0.05, detail = ("calculating surface structure deduction")) #print the progress to the website
  #d <- surfaceStructure(cropType, claySurface, siltSurface, ocSurfacePerc)

  
  #Subsurface Factors
  #Chemistry
  #Reaction (sV)
  if(printProgress) incProgress(0.05, detail = ("calculating subsurface reaction deduction")) #print the progress to the website
  sv <- reaction(cropType, subsurfacePH)
  #Salinity (sN)
  if(printProgress) incProgress(0.05, detail = ("calculating subsurface salinity deduction")) #print the progress to the website
  sn <- salinity(cropType, subsurfaceEC)
  #Sodicity (sY)
  #sarSubsurface <- ksatSubsurface / 10
  if(printProgress) incProgress(0.05, detail = ("calculating subsurface sodicity deduction")) #print the progress to the website
  sy <- sodicity(cropType, sarSubsurface)
  #Chemistry deduction (sC)
  sc <- max(sv, sn, sy)
  #Only the largest chemistry deduction is used.
  c <- max(c, sc)
  #Total surface deduction (d)
  #surfaceDeduction <- d + f + e + c + o
  if(printProgress) incProgress(0.05, detail = ("processing surface deduction")) #print the progress to the website
  surfaceDeduction <- d + f + c
  #Preliminary Soil Rating
  if(printProgress) incProgress(0.05, detail = ("provessing preliminary rating")) #print the progress to the website
  prelimRating <- 100 - m - surfaceDeduction
  #Basic Soil Rating (g)
  #basicRating <- prelimRating - sd
  
  #Drainage Factor (W)
  #slRatingTable$claySurface <- with(slRatingTable, replace(claySurface, claySurface == 0, 0.000001))
  #slRatingTable$siltSurface <- with(slRatingTable, replace(siltSurface, siltSurface == 0, 0.000001))
  w <- (drainage(soilClass, ppe, claySurface, siltSurface) / 100) * basicRating
  
  #Final Soil Rating
  points <- prelimRating# - w
  points[points<0] <- 0
  points[points>100] <- 100
  a <- 0 #placeholder for a

  return(c(points,m,a,d,f,v,sv,n,sn,y,sy, w))
}
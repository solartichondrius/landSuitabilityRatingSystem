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
  f <- organicMatterContent(ocSurfacePerc)
  #Topsoil depth deductions (E)
  #e <- topsoil(E_DEPTH)
  #Reaction (V)
  v <- reaction(surfacePH)
  #Salinity (N)
  n <- salinity(surfaceEC)
  #Sodicity (Y)
  #sarSurface <- ksatSurface / 10
  #y <- sodicity(sarSurface)
  #Chemistry deduction (c)
  #c <- chemistry(v, n, y)
  c <- ifelse(v > n, v, n)
  #Organic surfaces (O)
  # slRatingTable$bd <- with(slRatingTable, replace(bd, bd == 0, 0.12))
  # o <- organicSurface(P_DEPTH, bd)
  # slRatingTable$o <- o
  #Structure and consistency deductions (D)
  #d <- surfaceStructure(claySurface, siltSurface, ocSurfacePerc)
  
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
  #sy <- sodicity(sarSubsurface)
  #Chemistry deduction (sC)
  sc <- chemistry(sv, sn, sy)
  #Only the largest chemistry deduction is used.
  c <- ifelse(c > sc, c, sc)
  #Total surface deduction (d)
  #surfaceDeduction <- d + f + e + c + o
  surfaceDeduction <- f + c
  #Preliminary Soil Rating
  prelimRating <- 100 - m - surfaceDeduction
  #Basic Soil Rating (g)
  #basicRating <- prelimRating - sd
  
  #Drainage Factor (W)
  #slRatingTable$claySurface <- with(slRatingTable, replace(claySurface, claySurface == 0, 0.000001))
  #slRatingTable$siltSurface <- with(slRatingTable, replace(siltSurface, siltSurface == 0, 0.000001))
  w <- (drainage(soilClass, ppe, claySurface, siltSurface) / 100) * basicRating
  
  #Final Soil Rating
  points <- prelimRating# - w
  points <- ifelse(points < 0, 0, 
                   ifelse(points > 100, 100, points))
  
  #Create a new table containing all relevant columns from slTable
  #and the new columns for point calculations, which will be used
  #to find the class.
  # slRatingTableM <- slTableM[c("slc", "soilType", "claySurface", "claySubsurface",
  #                            "sandSurface", "sandSubsurface",
  #                            "siltSurface", "siltSubsurface", 
  #                            "cfSurface", "cfSubsurface", "awhcSurface", 
  #                            "awhcSubsurface", "ppe", "ocSurfacePerc",
  #                            "surfacePH", "subsurfacePH",
  #                            "surfaceEC", "subsurfaceEC",
  #                            "sarSurface", "sarSubsurface", 
  #                            "E_DEPTH", "bd", "egdd", "a")]
  # slRatingTableM$m <- m
  # slRatingTableM$f <- f
  # slRatingTableM$v <- v
  # slRatingTableM$n <- n
  # #slRatingTableM$y <- y
  # #slRatingTableM$d <- d
  # slRatingTableM$sv <- sv
  # slRatingTableM$sn <- sn
  # slRatingTableM$sy <- sy
  # slRatingTableM$c <- c
  # slRatingTableM$surfaceDeduction <- surfaceDeduction
  # slRatingTableM$prelimRating <- prelimRating
  # slRatingTableM$w <- w
  # slRatingTableM$points <- points
  # return(slRatingTableM)
  return(c(points, m, f, v, n, sv, sn, sy, w))
}
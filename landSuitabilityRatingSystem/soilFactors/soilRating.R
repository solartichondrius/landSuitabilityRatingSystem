#March 2, 2020
#Hayden McAdam
#Mineral Soil Rating
#Calculate the point deduction for the mineral soil factor
#and assign each row a suitability class from 1-7 based on it.

soilRating <- function(claySurface, claySubsurface,
                             sandSurface, sandSubsurface,
                             siltSurface, siltSubsurface,
                             cfSurface, cfSubsurface, 
                             awhcSurface, awhcSubsurface, ppe, ocSurfacePerc,
                             surfacePH, subsurfacePH, 
                             surfaceEC, subsurfaceEC, 
                             sarSurface, sarSubsurface, 
                             E_DEPTH, bd, egdd, a){
  
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
  # o <- organicSurface(P_DEPTH, bd)
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
  #w <- (drainage(wt, ppe, claySurface, siltSurface) / 100) * basicRating
  
  #Final Soil Rating
  points <- prelimRating# - w
  points <- ifelse(points < 0, 0, 
                   ifelse(points > 100, 100, points))
  
  #Assign a numeric class based on the points value.
  class <- pointsToClass(points)
  
  #Add subclasses to the class to indicate which deductions were made.
  #Only add subclass M if its deduction is more than 15 points greater
  #than the A deduction. Rows can't have both M and A subclasses.
  if(m > 15 && m > a+15){class <- paste(class, "M", sep="")}
  if(a > 15 && m <= a+15){class <- paste(class, "A", sep="")}
  if(d>15){class <- paste(class, "D", sep="")}
  if(f>15){class <- paste(class, "F", sep="")}
  #if(e>15){class <- paste(class, "E", sep="")}
  if(v>15 || sv>15){class <- paste(class, "V", sep="")}
  if(n>15 || sn>15){class <- paste(class, "N", sep="")}
  if(y>15 || sy>15){class <- paste(class, "Y", sep="")}
  #if(o>15){class <- paste(class, "O", sep="")}
  #if(w[n]>15){class <- paste(class, "W", sep="")}
  return(c(points, class))
}
#March 2, 2020
#Hayden McAdam
#Organic Soil Rating
#Calculate the point deduction for the organic soil factor
#and assign each row a suitability class from 1-7 based on it.

organicSoilRatingPoints <- function(egdd, ppe, surfaceFibre, subsurfaceFibre,
                                    waterTableDepth, soilPH, subsurfaceEC, 
                                    organicDepth, masterHorizon, substrateCF, 
                                    substrateSilt, substrateClay){
  
  #Organic Soil Temperature Factor (Z)
  z <- soilTemperature(egdd)
  #Organic Moisture Deficit Deduction (M)
  m1 <- moistureDeficit(surfaceFibre, ppe)
  m2 <- waterTableAdjustment(waterTableDepth, subsurfaceFibre) #/ -100
  m <- m1 + m2
  #Interim Rating
  a <- 100 - z - m
  
  #Surface Factor
  #Structure (B)
  s <- organicSurfaceStructure(surfaceFibre, ppe)
  #Chemistry
  v <- organicReaction(surfaceFibre, soilPH)
  n <- organicSalinity(surfaceEC)
  #Only the larger of the two deductions for reaction and salinity is used.
  chem <- ifelse(v > n, v, n)
  #Total percent deduction for surface factor.
  b <- ((s + chem) / 100) * a
  #Basic Rating
  c <- a - b
  
  #Subsurface Factor
  #Structure (sB)
  sb <- organicSubsurfaceStructure(subsurfaceFibre)
  #Substrate (G)
  g <- substrate(ppe, organicDepth, masterHorizon, 
                 substrateCF, substrateSilt, substrateClay)
  #Reaction (sV)
  sv <- organicSubsurfaceReaction(subsurfacePH)
  #Salinity (sN)
  sn <- organicSubsurfaceSalinity(subsurfaceEC)
  #Subsurface chemistry deduction is only used if it is greater than
  #the surface chemistry deduction.
  sChem <- ifelse(sv > sn, sv, sn)
  sChem <- ifelse(sChem > chem, sChem, 0)
  #Total percent deduction for subsurface factor.
  d <- sb + g + sChem
  #Interim Final Rating
  e <- c - d
  
  #Drainage Factor (W)
  w <- organicDrainage(waterTableDepth, subsurfaceFibre, ppe)
  f <- (w / 100) * e
  #Final Organic Soil Rating
  points <- e - f
  points <- ifelse(points < 0, 0, 
                   ifelse(points > 100, 100, points))
  
  #Assign a numeric class based on the points value.
  class <- pointsToClass(numbers)
  #Add subclasses to the class to indicate which deductions were made.
  if(z[i]>15){class <- paste(class, "Z", sep="")}
  if(m[i]>15){class <- paste(class, "M", sep="")}
  if(s[i]>15 || sb[i]>15){class <- paste(class, "B", sep="")}
  if(v[i]>15 || sv[i]>15){class <- paste(class, "V", sep="")}
  if(n[i]>15 || sn[i]>15){class <- paste(class, "N", sep="")}
  if(g[i]>15){class <- paste(class, "G", sep="")}
  if(w[i]>15){class <- paste(class, "W", sep="")}
  
  return(c(points, class))
}
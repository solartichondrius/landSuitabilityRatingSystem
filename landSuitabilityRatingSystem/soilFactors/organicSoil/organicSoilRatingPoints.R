#February 21, 2020
#Hayden McAdam
#Organic Soil Rating Points
#Calculate the point deduction for the organic soil factor.

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
  #Total percent deduction
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
  #Total percent deduction
  d <- sb + g + sChem
  #Interim Final Rating
  e <- c - d
  
  #Drainage Factor (W)
  w <- organicDrainage(waterTableDepth, subsurfaceFibre, ppe)
  f <- (w / 100) * e
  #Final Organic Soil Rating
  points <- e - f
  
  #Create a new table containing all relevant columns from slTable
  #and the new columns for point calculations, which will be used
  #to find the class.
  slRatingTable <- slTable[c("egdd", "ppe", "surfaceFibre", "subsurfaceFibre",
                             "waterTableDepth", "soilPH", "subsurfaceEC", 
                             "organicDepth", "masterHorizon", "substrateCF", 
                             "substrateSilt", "substrateClay")]
  slRatingTable$z <- z
  slRatingTable$m <- m
  slRatingTable$a <- a
  slRatingTable$s <- s
  slRatingTable$v <- v
  slRatingTable$n <- n
  slRatingTable$b <- b
  slRatingTable$c <- c
  slRatingTable$sb <- sb
  slRatingTable$g <- g
  slRatingTable$sv <- sv
  slRatingTable$sn <- sn
  slRatingTable$sChem <- sChem
  slRatingTable$d <- d
  slRatingTable$e <- e
  slRatingTable$w <- w
  slRatingTable$f <- f
  slRatingTable$points <- points
  return(slRatingTable)
}
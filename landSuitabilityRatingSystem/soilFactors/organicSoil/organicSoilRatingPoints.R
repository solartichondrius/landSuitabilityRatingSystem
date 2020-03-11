#February 21, 2020
#Hayden McAdam
#Organic Soil Rating Points
#Calculate the point deduction for the organic soil factor.

organicSoilRatingPoints <- function(slc, soilType, egdd, ppe, 
                                    surfaceFibre, subsurfaceFibre,
                                    waterTableDepth, surfacePH, subsurfacePH,
                                    surfaceEC, subsurfaceEC, 
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
  v <- organicReaction(surfaceFibre, surfacePH)
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
  #g <- substrate(ppe, organicDepth, masterHorizon, 
  #substrateCF, substrateSilt, substrateClay)
  g <- 0
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
  points <- ifelse(points < 0, 0, 
                   ifelse(points > 100, 100, points))
  
  #Create a new table containing all relevant columns from slTable
  #and the new columns for point calculations, which will be used
  #to find the class.
  slRatingTableO <- slTableO[c("slc", "soilType", "egdd", "ppe", 
                             "surfaceFibre", "subsurfaceFibre",
                             "waterTableDepth", "surfacePH", "subsurfacePH", 
                             "surfaceEC",  "subsurfaceEC", 
                             "organicDepth", "masterHorizon", "substrateCF", 
                             "substrateSilt", "substrateClay")]
  slRatingTableO$z <- z
  slRatingTableO$m <- m
  slRatingTableO$a <- a
  slRatingTableO$s <- s
  slRatingTableO$v <- v
  slRatingTableO$n <- n
  slRatingTableO$b <- b
  slRatingTableO$c <- c
  slRatingTableO$sb <- sb
  slRatingTableO$g <- g
  slRatingTableO$sv <- sv
  slRatingTableO$sn <- sn
  slRatingTableO$sChem <- sChem
  slRatingTableO$d <- d
  slRatingTableO$e <- e
  slRatingTableO$w <- w
  slRatingTableO$f <- f
  slRatingTableO$points <- points
  return(slRatingTableO)
}
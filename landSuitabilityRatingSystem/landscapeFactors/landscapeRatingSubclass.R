landscapeRatingSubclass <- function(slc, region, ps, lt, s, cf,
                                    surface, subsurface, pattern, 
                                    inundationPeriod, usableGrowingSeasonLength, 
                                    frequency) {
  # slc <- 167
  # region <- 2
  # ps <- 0
  # lt <- "complex"
  # s <- 0.12701708
  # cf <- 1
  # surface <- 0
  # subsurface <- 0
  # pattern <- 0
  # inundationPeriod <- 1
  # usableGrowingSeasonLength <- 1
  # frequency <- 1
  
  t <- tRating(region, ps, lt)
  a <- 100 - t
  P <- (pRating(s, cf) / 100) * a
  J <- woodContent(surface, subsurface)
  K <- pattern
  I <- flooding(inundationPeriod, usableGrowingSeasonLength, frequency)
  
  subclassTable <- data.frame(slc = 1:length(slc))
  subclassTable$t <- t
  subclassTable$p <- P
  subclassTable$j <- J
  subclassTable$k <- K
  subclassTable$i <- I
  
  C <- ""
  if (t>15){C <- paste(C, "T", sep = "")}
  if (P>15){C <- paste(C, "P", sep = "")}
  if (J>15){C <- paste(C, "J", sep = "")}
  if (K>15){C <- paste(C, "K", sep = "")}
  if (I>15){C <- paste(C, "I", sep = "")}
  subclassTable$subclass <- C
  
  return(subclassTable)
}
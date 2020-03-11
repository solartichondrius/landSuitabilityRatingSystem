#February 12, 2020
#Hayden McAdam
#Water Table Deduction - Currently not included in data.
waterTable <- function(waterTableDepth, claySurface, siltSurface){
  pointDeduction <- 100 - waterTableDepth * (log10(waterTableDepth) ^ 3) / (6 + (siltSurface + claySurface) / 25)
  return(pointDeduction)
}
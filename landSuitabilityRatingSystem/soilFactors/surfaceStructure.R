#February 2020
#Hayden McAdam
#Calculates surface structure/consistence deduction (D) for mineral soils 
#based on the surface clay, silt, and organic content (Table 4.5).
surfaceStructure <- function(cropType, claySurface, siltSurface, ocSurfacePerc) {
  if (cropType == "SSSG") {
    surfaceS <- 100 - claySurface - siltSurface
    pointDeduction <- ocSurfacePerc
    pointDeduction[ocSurfacePerc>=2.5] <- 0
    pointDeduction[ocSurfacePerc<2.5] <- (2.5 / ocSurfacePerc[ocSurfacePerc<2.5]) + ((surfaceS[ocSurfacePerc<2.5]) / 3 * ocSurfacePerc[ocSurfacePerc<2.5]) + siltSurface[ocSurfacePerc<2.5]
    pointDeduction < pointDeduction
  }
  #Prevent negative deductions and deductions greater than 15 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
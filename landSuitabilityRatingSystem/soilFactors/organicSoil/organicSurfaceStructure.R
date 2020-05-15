#February 21, 2020
#Hayden McAdam
#Calculate surface structure/consistence deduction (B) for organic soils
#based on surface fibre and P-PE (Table 5.5).
organicSurfaceStructure <- function(cropType, surfaceFibre, ppe) {
  if (cropType == "SSSG") {
    pointDeduction <- (40.00874 +
      -2.391297 * surfaceFibre +
      0.213398 * ppe +
      0.045354 * surfaceFibre^2 +
      0.0006141 * ppe^2 +
      -0.009623 * surfaceFibre * ppe +
      -0.000233 * surfaceFibre^3 +
      2.78E-07 * ppe^3 +
      -3.53E-06 * surfaceFibre * ppe^2 +
      7.33E-05 * surfaceFibre^2 * ppe)
  }
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
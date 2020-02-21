#February 21, 2020
#Hayden McAdam
#Organic Surface Structure Deduction (B)
organicSurfaceStructure <- function(surfaceFibre, ppe){
  pointDeduction <- (40.00874 + -2.391297 * surfaceFibre + 0.213398 * ppe + 
    0.045354*surfaceFibre^2 + 0.0006141 * ppe ^ 2 +-0.009623 * surfaceFibre * ppe +
    -0.000233 * surfaceFibre ^ 3 + 2.78E-07 * ppe ^ 3 + 
    -3.53E-06 * surfaceFibre * ppe ^ 2 + 7.33E-05 * surfaceFibre ^ 2 * ppe)
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 100, 100, pointDeduction))
  return(pointDeduction)
}
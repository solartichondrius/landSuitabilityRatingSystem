#February 2020
#Hayden McAdam
#Surface / Consistence (D) - (Table 4.5)
surfaceStructure <- function(claySurface, siltSurface, ocSurfacePerc){
  surfaceS <- 100 - claySurface - siltSurface
  pointDeduction <- ifelse(ocSurfacePerc < 2.5, ((2.5 / ocSurfacePerc) + ((surfaceS)/3 * ocSurfacePerc) + siltSurface), 0)
  #Prevent negative deductions and deductions greater than 15 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 15, 15, pointDeduction))
  return(pointDeduction)
}
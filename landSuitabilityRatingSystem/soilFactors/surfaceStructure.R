#Surface / Consistence (D) - (Table 4.5)
surfaceStructure <- function(claySurface, siltSurface, ocSurfacePerc){
  surfaceS <- 100 - claySurface - siltSurface
  pointDeduction <- ifelse(ocSurfacePerc < 2.5, ((2.5 / ocSurfacePerc) + ((surfaceS)/3 * ocSurfacePerc) + siltSurface), 0)
  return(pointDeduction)
}
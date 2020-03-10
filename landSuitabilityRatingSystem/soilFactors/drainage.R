#February 14, 2020
#Hayden McAdam
#Calculates the drainage factor (W) deduction for mineral soils based on
#the water table depth, P-PE, and the clay and silt content in the surface.
#This deduction is applied as a percentage of the surface rating.
drainage <- function(wt, ppe, claySurface, siltSurface){
  pointDeduction <- (100 - ((100 + ppe) / -100) *3) - (wt * (1.65 / log10(claySurface + siltSurface)))
}
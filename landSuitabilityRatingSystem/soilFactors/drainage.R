#February 14, 2020
#Hayden McAdam
#Drainage Factor (W)
drainage <- function(wt, ppe, claySurface, siltSurface){
  pointDeduction <- (100 - ((100 + ppe) / -100) *3) - (wt * (1.65 / log10(claySurface + siltSurface)))
}
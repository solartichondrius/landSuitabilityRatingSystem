#February 14, 2020
#Hayden McAdam
#Calculates the drainage factor (W) deduction for mineral soils based on the soil type, P-PE,
#and surface clay and silt content. This deduction is applied as a percentage of the surface rating.

#NOTE: This function is based partly on the Ruby code, but also uses new code
#for calculating drainage codes based on the soil type. These calculations are
#not confirmed to be accurate yet and may need to be changed in the future.

drainage <- function(soilType, ppe, claySurface, siltSurface){
  #Assign drainage codes from 1 - 5 to indicate the drainage category based on the soil type.
  dc <- soilType
  dc[dc < 8 | dc > 19 & dc < 25 | dc == 30] <- 1
  dc[dc == 8 | dc == 15 | dc == 16 | dc == 25 | dc == 29 | dc == 31] <- 2
  dc[dc == 9 | dc == 10 | dc == 26 | dc == 27 | dc == 28] <- 3
  dc[dc == 11 | dc == 12 | dc == 13 | dc == 17 | dc == 18] <- 4
  dc[dc == 14 | dc == 19] <- 5
  #Assign water table depth value using drainage codes.
  wt <- dc
  wt[wt == 1] <- 125
  wt[wt == 2] <- 100
  wt[wt == 3] <- 75
  wt[wt == 4] <- 50
  wt[wt == 5] <- 25
  #Replace NA and 0 values in claySurface and siltSurface with 0.000001 to avoid math errors.
  claySurface[is.na(claySurface[])] <- 0.000001
  claySurface[claySurface == 0] <- 0.000001
  siltSurface[is.na(siltSurface[])] <- 0.000001
  siltSurface[siltSurface == 0] <- 0.000001
  #Calculate drainage point deduction.
  pointDeduction <- ((100 - ((100 + ppe) / -100) * 3) - (wt * (1.65 / log10(claySurface + siltSurface))))
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction < 0] <- 0
  pointDeduction[pointDeduction > 100] <- 100
  return(pointDeduction)
}
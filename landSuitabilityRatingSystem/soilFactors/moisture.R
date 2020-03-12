#February 2020
#Hayden McAdam
#Moisture Factor (M)
#Calculate the surface moisture point deduction based on table 4.2.
moisture <- function(cropType, siltSurface, siltSubsurface, claySurface, claySubsurface, cfSurface, cfSubsurface, awhcSurface, ppe, printProgress=FALSE) {
  #Test values
  # claySurface <- 48
  # siltSurface <- 41
  # cfSurface <- 0
  # claySubsurface <- 60
  # siltSubsurface <- 30
  # cfSubsurface <- 0
  # ppe <- -253
  # awhcSurface <- (claySurface + siltSurface) * 2 + 35

  # claySurface <- 25.33
  # siltSurface <- 24.67
  # cfSurface <- 1.33
  # claySubsurface <- 39
  # siltSubsurface <- 29.5
  # cfSubsurface <- 2
  # ppe <- -155.7
  # awhcSurface <- 14
  if (cropType == "SSSG") {
    #Surface moisture (Table 4.2)
    if(printProgress) incProgress(0.05, detail = ("calculating surface moisture deduction")) #print the progress to the website
    surfaceMoisture <- (claySurface + siltSurface) * (1 - cfSurface / 100)
    if(printProgress) incProgress(0.05, detail = ("calculating surface available water holding capacity deduction")) #print the progress to the website
    surfaceAwhcDeduction1 <- (awhcSurface + ppe) * -0.2
    surfaceAwhcDeduction2 <- surfaceMoisture
    surfaceAwhcDeduction2[surfaceMoisture>=0] <- 28 - (1 / sqrt(abs(ppe[surfaceMoisture>=0] / -100))) * (surfaceMoisture[surfaceMoisture>=0] - 20)
    surfaceAwhcDeduction2[surfaceMoisture<0] <- 60 - 1.5 * surfaceMoisture[surfaceMoisture<0]
    surfaceAwhcDeduction2 <- surfaceAwhcDeduction2
    surfaceAwhcDeduction <- surfaceAwhcDeduction1 + surfaceAwhcDeduction2
    #Subsurface texture (Table 4.3)
    if(printProgress) incProgress(0.05, detail = ("calculating subsurface moisture deduction")) #print the progress to the website
    subsurfaceMoisture <- (claySubsurface + siltSubsurface) * (1 - cfSubsurface / 100)
    totalMoisture <- (surfaceMoisture + subsurfaceMoisture) / 2
    if(printProgress) incProgress(0.05, detail = ("calculating subsurface available water holding capacitydeduction")) #print the progress to the website
    subsurfaceAwhcDeduction1 <- (150 + ppe) * -0.2
    subsurfaceAwhcDeduction2 <- totalMoisture
    subsurfaceAwhcDeduction2[totalMoisture>20] <- 28 - (1 / sqrt(abs(ppe[totalMoisture>20] / -100))) * (totalMoisture[totalMoisture>20] - 20)
    subsurfaceAwhcDeduction2[totalMoisture<=20] <- 60 - 1.5 * totalMoisture[totalMoisture<=20]
    subsurfaceAwhcDeduction2 <- subsurfaceAwhcDeduction2
    #Subtotal texture deduction
    if(printProgress) incProgress(0.05, detail = ("calculating texture deduction")) #print the progress to the website
    subsurfaceAwhcDeduction <- subsurfaceAwhcDeduction1 + subsurfaceAwhcDeduction2
    subsurfaceAdjustment <- subsurfaceAwhcDeduction - surfaceAwhcDeduction
    pointDeduction <- surfaceAwhcDeduction + subsurfaceAdjustment
  }
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
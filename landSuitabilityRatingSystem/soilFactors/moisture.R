#Moisture Factor (M)
#Calculate the surface moisture point deduction based on table 4.2.
moisture <- function(siltSurface, siltSubsurface, claySurface, 
                            claySubsurface, cfSurface, cfSubsurface, 
                            awhcSurface, ppe){
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
  
  #Surface moisture (Table 4.2)
  surfaceMoisture <- (claySurface + siltSurface) * (1 - cfSurface / 100)
  surfaceAwhcDeduction1 <- (awhcSurface + ppe) * -0.2
  surfaceAwhcDeduction2 <- ifelse(surfaceMoisture < 0, 60 - 1.5 * surfaceMoisture, 
                           28 - (1 / sqrt(min(ppe) / -100)) * (surfaceMoisture - 20))
  surfaceAwhcDeduction <- surfaceAwhcDeduction1 + surfaceAwhcDeduction2
  #Subsurface texture (Table 4.3)
  subsurfaceMoisture <- (claySubsurface + siltSubsurface) * (1 - cfSubsurface / 100)
  totalMoisture <- (surfaceMoisture + subsurfaceMoisture) / 2
  subsurfaceAwhcDeduction1 <- (150 + ppe) * -0.2
  subsurfaceAwhcDeduction2 <- ifelse(totalMoisture <= 20, 60 - 1.5 * totalMoisture,
                                     28 - (1 / sqrt(min(ppe) / -100)) * (totalMoisture - 20))
  #Subtotal texture deduction
  subsurfaceAwhcDeduction <- subsurfaceAwhcDeduction1 + subsurfaceAwhcDeduction2
  subsurfaceAdjustment <- subsurfaceAwhcDeduction - surfaceAwhcDeduction
  pointDeduction <- surfaceAwhcDeduction + subsurfaceAdjustment
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 100, 100, pointDeduction))
  return(pointDeduction)
}
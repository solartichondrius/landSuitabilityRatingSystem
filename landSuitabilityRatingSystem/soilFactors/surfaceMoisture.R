#Moisture Factor (M)
#Calculate the surface moisture point deduction based on table 4.2.
surfaceMoisture <- function(awhcSurface, ppe){
  #AWHC between 0 and 10
  pointDeduction <- if (awhcSurface < 10) {
    ppe * -0.2 + 40
  #AWHC between 10 and 20
  } else if (awhcSurface < 20) {
    ppe * -0.2 + 15
  #AWHC between 20 and 40
  } else if (awhcSurface < 40 & ppe > -150) {
    ppe * -0.2 - 10
  } else if (awhcSurface < 40 & ppe <= -150) {
    ppe * -0.3 - 20
  } else if (awhcSurface < 40 & ppe <= -250) {
    ppe * -0.2
  #AWHC between 40 and 60
  } else if (awhcSurface < 60 & ppe > -250) {
    ppe * -0.2 - 20
  } else if (awhcSurface < 60 & ppe > -350) {
    ppe * -0.3 - 40
  } else if (awhcSurface < 60 & ppe <= -350) {
    ppe * -0.2 - 10
  #AWHC between 60 and 70
  } else if (awhcSurface < 70 & ppe > -250) {
    ppe * -0.2 - 30
  } else if (awhcSurface < 70 & ppe > -350) {
    ppe * -0.3 - 50
  } else if (awhcSurface < 70 & ppe <= -350) {
    ppe * -0.2 - 20
  #AWHC between 70 and 80
  } else if (awhcSurface < 80 & ppe > -350) {
    ppe * -0.2 - 30
  } else if (awhcSurface < 80 & ppe > -400) {
    ppe * -0.3 - 60
  } else if (awhcSurface < 80 & ppe <= 400) {
    ppe * -0.2 - 25
  #AWHC greater than 80
  } else {
    ppe * -0.2 - 30
  }
  
  #moisture <- (claySurface + siltSurface) * (1 - cfSurface / 100)
  
  return(pointDeduction)
}
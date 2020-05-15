#January 21, 2020
#Hayden McAdam
#Calculate basic landform topography rating (T) based on the area's
#percent slope (ps), and landscape factor (ls).

topography <- function(cropType, ps, ls) {
  if(cropType=="SSSG"){
    #Variables for simple landscapes (lsFactor >= 0.7)
    a <- 66.560928
    b <- 2.156809
    c <- -38.609623
    d <- 54.877374
    #Variables for complex landscapes (lsFactor < 0.7)
    e <- 128.20977
    f <- 8.5212186
    g <- 24.148183
    h <- 126.64124
    #Set point deduction values equal to lsFactor 
    #so they can be replaced with the appropriate deduction.
    pointDeduction <- ls
    #Replace point deduction values with the correct equation
    #based on the value of lsFactor.
    pointDeduction[pointDeduction >= 0.7] <- a+b*ps - sqrt((c+b*ps)^2+d^2)
    pointDeduction[pointDeduction < 0.7] <- e+f*ps - sqrt((g+f*ps)^2+h^2)
  }
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
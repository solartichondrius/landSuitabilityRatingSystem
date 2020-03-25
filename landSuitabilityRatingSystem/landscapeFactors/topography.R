#January 21, 2020
#Hayden McAdam
#Calculate basic landform topography rating (T) based on the area's
<<<<<<< HEAD
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
=======
#climate erosivity region, percent slope (ps), and landscape type (lt).
topography <- function(cropType, region, ps, lt) {
  #create a single variable where region is the tens column, landscape type is the ones column, and percent slope is after the decimal
  pointDeduction <- region
  if(cropType=="SSSG"){
    #apply the relevant function where region is 2 and landscape type is 1 (simple)
    pointDeduction[floor(pointDeduction)==21] <- 66.560928+2.156809*(pointDeduction[floor(pointDeduction)==21]%%1*100)-sqrt((pointDeduction[floor(pointDeduction)==21]%%1*100*2.156809-38.609623)^2+3011.52617714)+256
    #apply the relevant function where region and slope are either 20 or 11 or 10
    pointDeduction[floor(pointDeduction)<21] <- 128.20977+8.5212186*(pointDeduction[floor(pointDeduction)<21]%%1*100)-sqrt((pointDeduction[floor(pointDeduction)<21]%%1*100*8.5212186+24.148183)^2+16038.0036687)+256
    #Prevent negative deductions and deductions greater than 100 points.
    pointDeduction <- pointDeduction - 256
>>>>>>> master
  }
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
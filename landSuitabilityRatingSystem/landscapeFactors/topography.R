#January 21, 2020
#Hayden McAdam
#Calculate basic landform topography rating (T) based on the area's
#climate erosivity region, percent slope (ps), and landscape type (lt).
topography <- function(cropType, ps, ls) {
  #create a single variable where region is the tens column, landscape type is the ones column, and percent slope is after the decimal
  if(cropType=="SSSG"){
    if(ls > 0.7){
      lt <- "simple"
    } else {
      lt <- "complex"
    }
    if(lt <- "simple"){
      a <- 66.560928
      b <- 2.156809
      c <- -38.609623
      d <- 54.877374
    } else {
      a <- 128.20977
      b <- 8.5212186
      c <- 24.148183
      d <- 126.64124
    }
    #apply the relevant function where region is 2 and landscape type is 1 (simple)
    #pointDeduction[floor(pointDeduction)==21] <- 66.560928+2.156809*(pointDeduction[floor(pointDeduction)==21]%%1*100)-sqrt((pointDeduction[floor(pointDeduction)==21]%%1*100*2.156809-38.609623)^2+3011.52617714)+900
    #apply the relevant function where region and slope are either 20 or 11 or 10
    #pointDeduction[floor(pointDeduction)<21] <- 128.20977+8.5212186*(pointDeduction[floor(pointDeduction)<21]%%1*100)-sqrt((pointDeduction[floor(pointDeduction)<21]%%1*100*8.5212186+24.148183)^2+16038.0036687)+900
    #Prevent negative deductions and deductions greater than 100 points.
    #pointDeduction <- pointDeduction - 900
    pointDeduction <- a+b*ps - sqrt((c+b*ps)^2+d^2)
  }
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
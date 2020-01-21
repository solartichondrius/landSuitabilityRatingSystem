# Title     : Land Suitability Rating System For Agricultural Crops
# Objective : To plot the graphs from the Land Suitability Rating System for Agricultural Crops in R
# Created by: Thomas Curtis
# Created on: 2020-01-17

#Figure 3.1: Point Deductions for moisture index values for spring-seeded small grains
pointDeductions_moistureIndexValues <- function(x){(70*x)/(-500)}
plot(pointDeductions_moistureIndexValues,xlim=c(-500,0),ylim=c(0,70),main="Point Deductions for moisture index values for spring-seeded small grains",ylab="Point Deduction",xlab="P-PE(mm)")

#Figure 3.2: Point deductions for effective growing degree day (EGDD) values for spring-seeded small grains.
pointDeductions_EGDD <- data.frame(x=1:1600,y=0)
for(x in 1:1600){
  if(pointDeductions_EGDD$x[x]<900) {
    pointDeductions_EGDD$y[x] <- -0.05*x + 115
  }else{
    pointDeductions_EGDD$y[x] <- -0.10*x + 160.00
  }
}
plot(pointDeductions_EGDD,xlim=c(600,1600),ylim=c(0,100),main="Point deductions for effective growing degree day (EGDD) values for spring-seeded small grains.",ylab="Point Deduction",xlab="EGDD")

#Figure 3.3: Percent defuction for P-PE (May)
percentDeduction_PPE_May <- function(x){(5*x)/50+5}
plot(percentDeduction_PPE_May,xlim=c(-50,50),ylim=c(0,10),main="Percent deduction for P-PE (May)",ylab="Percent Deduction",xlab="P=PE(mm) for May")

#Figure 3.4: Percent deduction for P-PE (September)
percentDeduction_PPE_September <- function(x){(10*x)/100}
plot(percentDeduction_PPE_September,xlim=c(0,100),ylim=c(0,10),main="Percent deduction for P-PE (September)",ylab="Percent Deduction",xlab="P=PE(mm) for September")

#Figure 3.5 Percent deduction for early frost.
percentDeduction_earlyFrost <- function(x){(10*x)/30}
plot(percentDeduction_earlyFrost,xlim=c(0,30),ylim=c(0,10),main="Percent deduction for early frost",ylab="Percent Deduction",xlab="Days before Average Fall Frost")

#Figure 6.2: Deductions related to slope gradient for all landscape types in Region 1 and for landscapes with complex slopes in Region 2.
pointDeductions_complexSlope <- data.frame(x=0:100,y=0)
for(x in 1:100){
  i <- x-1
  if(pointDeductions_complexSlope$x[x]<5) {
    pointDeductions_complexSlope$y[x] <- 8*i
  }else if(pointDeductions_complexSlope$x[x]<15){
    pointDeductions_complexSlope$y[x] <- 3*i+25
  }else if(pointDeductions_complexSlope$x[x]<30){
    pointDeductions_complexSlope$y[x] <- 2*i/3+60
  }else{
    pointDeductions_complexSlope$y[x] <- i/3+70
  }
}
plot(pointDeductions_complexSlope,xlim=c(0,60),ylim=c(0,100),main="Deductions related to slope gradient for all landscape types in Region 1 and for landscapes with complex slopes in Region 2.",ylab="Deduction Points",xlab="Percent Slope")
lines(pointDeductions_complexSlope)

#Figure 6.3: Deductions related to slope gradient for landscapes with simple slopes in Region 2.
pointDeductions_simpleSlope <- data.frame(x=0:100,y=0)
for(x in 1:100){
  i <- x-1
  if(pointDeductions_simpleSlope$x[x]<10){
    pointDeductions_simpleSlope$y[x] <- 4*i
  }else if(pointDeductions_simpleSlope$x[x]<20){
    pointDeductions_simpleSlope$y[x] <- 3*i+10
  }else if(pointDeductions_simpleSlope$x[x]<30){
    pointDeductions_simpleSlope$y[x] <- i+50
  }else{
    pointDeductions_simpleSlope$y[x] <- i/3+70
  }
}
plot(pointDeductions_simpleSlope,xlim=c(0,60),ylim=c(0,100),main="Deductions related to slope gradient for landscapes with simple slopes in Region 2.",ylab="Deduction Points",xlab="Percent Slope")
lines(pointDeductions_simpleSlope)

#Figure 6.4 Deductions for surface stoniness.
percentDeduction_surfaceStoniness <- function(x){60*x}
plot(percentDeduction_surfaceStoniness,xlim=c(0,1.8),ylim=c(0,100),main="Deductions for surface stoniness. ",ylab="Percent Deduction",xlab="Annual Removal(cubic m/ha)")

#Figure 6.5 Deductions for coarse fragment (gravel) content.
percentDeduction_coarseFragmentContent <- data.frame(x=10:50,y=0)
for(x in 10:50){
  i <- x-9
  if(percentDeduction_coarseFragmentContent$x[i]<30){
    percentDeduction_coarseFragmentContent$y[i] <- 3*x/4-7.5
  }else{
    percentDeduction_coarseFragmentContent$y[i] <- x/2
  }
}
plot(percentDeduction_coarseFragmentContent,xlim=c(0,60),ylim=c(0,25),main="Deductions for coarse fragment (gravel) content.",ylab="Percent Deduction",xlab="Coarse Frament Content(% vol")
lines(percentDeduction_coarseFragmentContent)

#Figure A.1 Daylength factor for latitudes north of 49° N
daylengthFactor_degreesNLatitude <- data.frame(x=49:62)
for(x in 49:62){
  i <- x-48
  if(daylengthFactor_degreesNLatitude$x[i]<50){
    daylengthFactor_degreesNLatitude$y[i] <- x/125+76/125
  }else if(daylengthFactor_degreesNLatitude$x[i]<52){
    daylengthFactor_degreesNLatitude$y[i] <- 3*x/500+177/250
  }else if(daylengthFactor_degreesNLatitude$x[i]<54){
    daylengthFactor_degreesNLatitude$y[i] <- x/125+151/250
  }else if(daylengthFactor_degreesNLatitude$x[i]<56){
    daylengthFactor_degreesNLatitude$y[i] <- 11*x/1000+221/500
  }else if(daylengthFactor_degreesNLatitude$x[i]<58){
    daylengthFactor_degreesNLatitude$y[i] <- 3*x/200+109/500
  }else if(daylengthFactor_degreesNLatitude$x[i]<60){
    daylengthFactor_degreesNLatitude$y[i] <- 3*x/125-38/125
  }else if(daylengthFactor_degreesNLatitude$x[i]<61){
    daylengthFactor_degreesNLatitude$y[i] <- 11*x/250-188/125
  }else{
    daylengthFactor_degreesNLatitude$y[i] <- 118/100
  }
}
plot(daylengthFactor_degreesNLatitude,xlim=c(49,62),ylim=c(1,1.2),main="Daylength factor for latitudes north of 49° N",ylab="Daylight Factor",xlab="Degrees N Latitude")
lines(daylengthFactor_degreesNLatitude)


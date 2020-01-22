# Title     : Slope
# Objective : Calculate the deduction points for slopes
# Created by: CurtisTh
# Created on: 2020-01-22

slope <- function(percentSlope,region,simpleOrComplex){

  if(tolower(simpleOrComplex) != "simple" & tolower(simpleOrComplex) != "complex"){
    return("Invalid input for 'simple or complex', please enter either 'simple' or 'complex'.")
  } else if(region != 1 & region != 2){
    return("Invalid input for 'region', please enter either '1' or '2'.")
  } else if(percentSlope < 0 | percentSlope > 100){
    return("Invalid input for 'slope percentage'. Slope percentage must be between 0 and 100.")
  } else if(region == 2){
    if(tolower(simpleOrComplex) == "simple"){
      pointDeduction <- region2SimpleSlope(percentSlope)
    } else {
      pointDeduction <- region1AllSlopesAndRegion2ComplexSlopes(percentSlope)
    }
  } else {
    pointDeduction <- region1AllSlopesAndRegion2ComplexSlopes(percentSlope)
  }

  return(pointDeduction)

}
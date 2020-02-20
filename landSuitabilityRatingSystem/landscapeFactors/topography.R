#January 21, 2020
#Hayden McAdam
#Calculate basic landform topography rating (T) based on the area's
#climate erosivity region, percent slope (ps), and landscape type (lt).
topography <- function(region, ps, lt) {
  #Calculates the landscape type when given the slope length.
  # if (sl >= 100) {
  #   lt <- "simple"
  # } else {
  #   lt <- "complex"
  # }
  if (any(region == 2 & lt == "simple")){
    #Assign input variables for simple landscapes in region 2.
    a <- 66.560928
    b <- 2.156809
    c <- -38.609623
    d <- 54.877374
  } else {
    #Assign input variables for complex landscapes in region 2 and 
    #both landscape types in region 1.
    a <- 128.20977
    b <- 8.5212186
    c <- 24.148183
    d <- 126.64124
  }
  #Calculate topography factor point deduction using the previously assigned
  #input variables.
  pointDeduction <- a+b*ps - sqrt((c+b*ps)^2+d^2)
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                       ifelse(pointDeduction > 100, 100, pointDeduction))
  return(pointDeduction)
}
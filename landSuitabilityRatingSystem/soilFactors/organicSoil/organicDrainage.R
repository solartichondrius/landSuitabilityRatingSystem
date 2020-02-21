#February 21, 2020
#Hayden McAdam
#Organic Drainage Deduction
organicDrainage <- function(waterTableDepth, subsurfaceFibre, ppe){
  pointDeduction <- (100 - ((((ppe-150)/-150)^2)*(sqrt(subsurfaceFibre/10)))-
                            (waterTableDepth*sqrt((ppe - 150)/-300)))
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 100, 100, pointDeduction))
  return(pointDeduction)
}
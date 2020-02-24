#February 21, 2020
#Hayden McAdam
#Organic Surface Salinity
organicSalinity <- function(surfaceEC){
  pointDeduction <- (-13.230275*22.752925+94.480275*surfaceEC^1.67181) /
    (22.752925+surfaceEC^1.67181)
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 100, 100, pointDeduction))
  return(pointDeduction)
}
#February 21, 2020
#Hayden McAdam
#Organic Subsurface Salinity
organicSubsurfaceSalinity <- function(subsurfaceEC){
  pointDeduction <- (-13.333333 + 3.75 * subsurfaceEC + 
                       -0.10416667 * subsurfaceEC ^ 2)
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 100, 100, pointDeduction))
  return(pointDeduction)
}
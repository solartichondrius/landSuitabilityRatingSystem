#February 21, 2020
#Hayden McAdam
#Organic Subsurface Structure Deduction
organicSubsurfaceStructure <- function(subsurfaceFibre){
  pointDeduction <- ifelse(subsurfaceFibre >= 40, -20+0.5*subsurfaceFibre,
                           ifelse(subsurfaceFibre <= 20, (20+-1*subsurfaceFibre)
                                  /(1+0.1*subsurfaceFibre), 0))
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 100, 100, pointDeduction))
  return(pointDeduction)
}
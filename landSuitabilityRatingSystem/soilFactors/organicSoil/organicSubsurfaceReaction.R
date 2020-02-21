#February 21, 2020
#Hayden McAdam
#Organic Subsurface Reaction
organicSubsurfaceReaction <- function(subsurfacePH){
  pointDeduction <- 60 + -10 * subsurfacePH
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 100, 100, pointDeduction))
  return(pointDeduction)
}
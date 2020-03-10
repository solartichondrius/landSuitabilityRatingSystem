#February 21, 2020
#Hayden McAdam
#Calculates the water table adjustment 
#for the organic soil moisture deficit factor (M) (Table 5.4).
waterTableAdjustment <- function(waterTableDepth, subsurfaceFibre){
  pointDeduction <- 100-((waterTableDepth^2)/12)/(5+(10/(0.1*subsurfaceFibre)))
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 100, 100, pointDeduction))
  return(pointDeduction)
}
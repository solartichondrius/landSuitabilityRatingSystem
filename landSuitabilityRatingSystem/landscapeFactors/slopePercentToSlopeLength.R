# Title     : Slope Percent To Landscape Type
# Objective : Convert slope percent to landscape type
# Created by: Thomas Curtis
# Created on: 2020-03-03

slopePercentToLandscapeType <- function(x){
  x[x > 0.7] <- 1 #less than 0.7 slope percent is simple (represented by a 1)
  x[x < 0.7] <- 0 #greater than 0.7 slope percent is complex (represented by a 0)
  return(x)
}
# Title     : Organic Matter Content
# Objective : Calculate the point deduction for Organic Matter Content
# Created by: CurtisTh
# Created on: 2020-01-22

organicMatterContent <- function(organicCarbon){ #organic carbon as a percentage
  pointDeduction <- 9.9928375 - 7.229321 * log(organicCarbon)
  #maximum deduction allowed is 15
  if(pointDeduction>15) pointDeduction <- 15 #so if its more than 15 then set it to 15
  if(pointDeduction<0) pointDeduction <- 0 #can't have a negative deduction (when it's subtracted that would result in adding points)
  return(pointDeduction)
}
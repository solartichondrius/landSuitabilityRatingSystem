# Title     : Organic Matter Content
# Objective : Calculate the point deduction for Organic Matter Content
# Created by: CurtisTh
# Created on: 2020-01-22

organicMatterContent <- function(organicCarbon){ #organic carbon as a percentage
  pointDeduction <- 9.9928375 - 7.229321 * log(organicCarbon)
  return(pointDeduction)
}
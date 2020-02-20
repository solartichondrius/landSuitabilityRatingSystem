# Title     : Soil Temperature
# Objective : Calculate the point deductions based on soil temperature
# Created by: CurtisTh
# Created on: 2020-01-22

soilTemperature <- function(EGDD){
  percentDeduction <- EGDD/-20 + 85
  return(percentDeduction)
}
# Title     : Soil Rating Points
# Objective : Calculate the soil rating
# Created by: CurtisTh
# Created on: 2020-01-22

soilRatingPoints <- function(EGDD){
  Z <- soilTemperature(EGDD)
  a <- 100 - Z
  #M <-
}
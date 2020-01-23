# Title     : Organic (Peaty) Surface
# Objective : Calculate the point deduction based on organic (peaty) surface
# Created by: CurtisTh
# Created on: 2020-01-22

organicSurface <- function(D, db=0.12){ #D=depth of organic horizon(s)(Ox), Db=bulk density of organic horizon
  pointDeduction <- (D-10)*(sqrt(0.12)/sqrt(db))
  if(D<10|pointDeduction<0) pointDeduction <- 0
  return(pointDeduction)
}
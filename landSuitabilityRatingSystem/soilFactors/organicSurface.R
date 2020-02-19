# Title     : Organic (Peaty) Surface
# Objective : Calculate the point deduction based on organic (peaty) surface
# Created by: CurtisTh
# Created on: 2020-01-22

organicSurface <- function(pDepth, bd){ #D=depth of organic horizon(s)(Ox), Db=bulk density of organic horizon
  #bd <- ifelse(bd == 0, 0.12, bd)
  pointDeduction <- ifelse(pDepth - 10 < 0, 0, (pDepth-10)*(sqrt(0.12)/sqrt(bd)))
  #if(pointDeduction > 100) pointDeduction <- 100
  return(pointDeduction)
}
#February 10, 2020
#Hayden McAdam
#Mineral Soil Rating Class
#Assign each row a suitability class from 1 - 7 based on the value of points.


soilRatingClass <- function(cropType, soilType, claySurface, claySubsurface, sandSurface, sandSubsurface, siltSurface, siltSubsurface, cfSurface, cfSubsurface, awhcSurface,
                            awhcSubsurface, ppe, ocSurfacePerc, surfacePH, subsurfacePH, surfaceEC, subsurfaceEC, sarSurface, sarSubsurface, E_DEPTH, bd, egdd, printProgress=FALSE){

  srp <- soilRatingPoints(cropType, soilType, claySurface, claySubsurface, sandSurface, sandSubsurface, siltSurface, siltSubsurface, cfSurface, cfSubsurface, awhcSurface,
                          awhcSubsurface, ppe, ocSurfacePerc, surfacePH, subsurfacePH, surfaceEC, subsurfaceEC, sarSurface, sarSubsurface, E_DEPTH, bd, egdd, printProgress)
  points <- srp[[1]]

  if(printProgress) incProgress(0.05, detail = ("Converting points to class")) #print the progress to the website
  class <- pointsToClass(points)*1000000
  if(printProgress) incProgress(0.05, detail = ("Calculating final rating class")) #print the progress to the website
  m <- srp[[2]]
  a <- srp[[3]]
  ma <- m - a
  ma[ma<15] <- 0
  ma[ma>=15] <- 100000
  am <- a - m
  am[am<15] <- 0
  am[am>=15] <- 200000
  d <- srp[[4]]
  d[d<15] <- 0
  d[d>=15] <- 10000
  f <- srp[[5]]
  f[f<15] <- 0
  f[f>=15] <- 1000
  v <- srp[[6]]
  v[v<15] <- 0
  v[v>=15] <- 100
  sv <- srp[[7]]
  sv[sv<15] <- 0
  sv[sv>=15] <- 100
  n <- srp[[8]]
  n[n<15] <- 0
  n[n>=15] <- 10
  sn <- srp[[9]]
  sn[sn<15] <- 0
  sn[sn>=15] <- 10
  y <- srp[[10]]
  y[y<15] <- 0
  y[y>=15] <- 1
  sy <- srp[[11]]
  sy[sy<15] <- 0
  sy[sy>=15] <- 1
  if(printProgress) incProgress(0.05, detail = ("Processing final rating class")) #print the progress to the website
  finalRatingClass <- class + max(ma,am) + d + f + max(v,sv) + max(n,sn) + max(y,sy)

  return(finalRatingClass)
}
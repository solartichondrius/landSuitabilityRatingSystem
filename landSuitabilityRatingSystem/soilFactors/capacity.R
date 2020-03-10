#February 2020
#Hayden McAdam
#Calculate available water holding capacity 
#using clay and silt content (Table 4.1).

capacity <- function(claySurface, siltSurface){
  awhc <- if((claySurface + siltSurface) <= 40) {
    (claySurface + siltSurface) * 2 + 20
  } else if ((claySurface + siltSurface) <= 85) {
    (claySurface + siltSurface) * 2 + 30
  } else {
    (claySurface + siltSurface) * 2 + 35
  }
  return(awhc)
}
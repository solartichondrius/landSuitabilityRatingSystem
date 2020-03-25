#February 12, 2020
#Hayden McAdam
#Depth of topsoil (E) - (Table 4.7) - Currently not included in data.
topsoil <- function(cropType, topsoilDepth){
  if(cropType=="SSSG") pointDeduction <- 20 + (-1 * topsoilDepth)
  return(pointDeduction)
}
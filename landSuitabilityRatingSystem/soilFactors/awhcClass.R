#Assign AWHC classes for surface and subsurface
awhcClass <- function(awhc){
  
  if(awhc >= 70){
    class <- "CL-C"
  } else if(awhc >= 60){
    class <- "L"
  } else if(awhc >= 40){
    class <- "SL"
  } else if(awhc >= 20){
    class <- "LS"
  } else {
    class <- "S"
  }
  return(class)
}
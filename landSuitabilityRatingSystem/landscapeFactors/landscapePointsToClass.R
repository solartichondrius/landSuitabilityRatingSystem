landscapePointsToClass <- function(number) {
  
  if(number >= 80){
    class <- 1
  } else if(number >= 60){
    class <- 2
  } else if(number >= 45){
    class <- 3
  } else if(number >= 30){
    class <- 4
  } else if(number >= 20){
    class <- 5
  } else if(number >= 10){
    class <- 6
  } else {
    class <- 7
  }
  
  return(class)
}
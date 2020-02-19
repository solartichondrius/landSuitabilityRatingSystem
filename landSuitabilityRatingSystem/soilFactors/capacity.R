#Available Water Holding Capacity
#The awhc values are already provided, so this function will probably
#not be used.
capacity <- function(clayAndSilt){
  awhc <- if(clayAndSilt <= 40) {
    clayAndSilt * 2 + 20
  } else if (clayAndSilt <= 85) {
    clayAndSilt * 2 + 30
  } else {
    clayAndSilt * 2 + 35
  }
  return(awhc)
}
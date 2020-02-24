#February 2020
#Hayden McAdam
#Chemistry Deduction
#Sets the final chemistry deduction to be equal to the largest of v, n, and y.
chemistry <- function(v, n , y){
  pointDeduction <- ifelse(v >= n & v >= y,  v, 
                           ifelse(n > v & n > y, n, y))
  return(pointDeduction)
}
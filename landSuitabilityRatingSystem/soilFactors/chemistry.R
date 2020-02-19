#Chemistry Deduction
chemistry <- function(v, n , y){
  pointDeduction <- ifelse(v >= n & v >= y,  v, 
                           ifelse(n > v & n > y, n, y))
  return(pointDeduction)
}
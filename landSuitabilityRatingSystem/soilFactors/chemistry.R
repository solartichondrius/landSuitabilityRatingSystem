#Chemistry Deduction
chemistry <- function(v, n , y){
  chemistryDeduction <- if(v >= n & v >=y){
    v
  } else if(n > v & n > y){
    n
  } else {
    y
  }
  return(chemistryDeduction)
}
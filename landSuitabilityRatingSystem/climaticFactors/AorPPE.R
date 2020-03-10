# Title     : A or P-PE
# Objective : Allows you to enter either the moisture factor (A) or precipitation (P) and evapotranspiration (PE)
# Created by: CurtisTh
# Created on: 2020-01-20

AorPPE <- function(...){ #function should take either 1 or 2 arguments

  x <- c(...) #put the arguments into a list

  if(length(x)==1){ #if there is only one argument then that is the moisture factor (A)
    A <- x[1]
  }else if(length(x)==2){ #if there are 2 arguments then the first one is precipitation (P) and the second one is evapotranspiration (PE)
    P <- x[1]
    PE <- x[2]
    A <- P - PE #the moisture factor is determined by calculating precipation (P) minus potentatial evapotranspiration (PE)
  }else{
    print("Invalid number of arguments. Enter either 1 number if you already know the moisture factor or if you don't you can enter the precipitation(P) first then the evapotranspiration(PE)")
    A <- NULL
  }

  return(A) #return the moisture factor (A)

}
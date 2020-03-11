# Title     : Create Data Frame
# Objective : Create a data frame using a function and a range of values from minX to maxX
# Created by: CurtisTh
# Created on: 2020-01-20

createDataFrame <- function(fun,min,max){ #takes a function and a minimum value of x and maximum value of x as arguments
  x <- data.frame(id=0:(max-min),x=min:max) #creates a data frame with x values from from min to max
  y <- data.frame(id=0:(max-min),y=mapply(function(x) fun(x),x=as.list(x$x))) #creates the y-values by applying the function to all the x-values
  df <- merge(x,y,by="id") #merges the x and y values into one dataframe
  df <- subset(df,select=c("x","y")) #only keep the x and y columns (the id was just needed to merge)
  return(df) #returns the dataframe
}
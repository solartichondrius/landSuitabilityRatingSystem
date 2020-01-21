# Title     : Plot Graph
# Objective : Plots a graph based on a given data frame
# Created by: CurtisTh
# Created on: 2020-01-20

plotGraph <- function(df,main,ylab,xlab){

  minX <- min(df[,1])
  maxX <- max(df[,1])
  minY <- min(df[,2])
  maxY <- max(df[,2])

  plot(df,xlim=c(minX,maxX),ylim=c(minY,maxY),main=main,xlab=xlab,ylab=ylab)
  lines(df)
}
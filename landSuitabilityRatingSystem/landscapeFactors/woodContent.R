# Title     : Wood Content
# Objective : Calculate percent deduction for wood content in organic soils
# Created by: CurtisTh
# Created on: 2020-01-21

woodContent <- function(vol, depth){ #wood content by volume (vol) and depth within the organic soil profile (depth)

  if(depth <= 40){
    if(vol <= 1){
      percentDeduction <- 0
    } else if(vol <= 2 | vol > 10){
      percentDeduction <- vol * 2.5
    } else if(vol <= 10){
      percentDeduction <- vol * 2
    }
  } else {
    if(vol <= 2){
      percentDeduction <- 0
    } else if(vol <= 10){
      percentDeduction <- vol
    } else {
      percentDeduction <- vol * 1.25
    }
  }

  return(percentDeduction)

}
# Title     : Moisture Factor (A)
# Objective : Calculate the deduction points for the moisture factor from May to August
# Created by: CurtisTh
# Created on: 2020-01-20

moistureFactor <- function(ppe){

  if(is.na(ppe)) return(NA) #if value is null return null value

  #Calculate the point deduction number based on the moisture component (A)
  #The graph in figure 3.1 on page 8 reaches 0 point deduction at 0mm which gives the following formula:
  #pointDeduction <- 70 * ppe / -500
  
  #But the text says that it reaches 0 point deduction at -150mm which gives the following formula:
  pointDeduction <- ppe / -5 - 30
<<<<<<< HEAD
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction <- ifelse(pointDeduction < 0, 0, 
                           ifelse(pointDeduction > 100, 100, pointDeduction))
=======
  
  if(all(pointDeduction<0)) pointDeduction <- 0 #can't have a negative deduction (when it's subtracted that would result in adding points)

>>>>>>> b1004ff2a4b1e1f7a06a85476463b5751a423dd4
  #Return the point deduction number
  return(pointDeduction)
}
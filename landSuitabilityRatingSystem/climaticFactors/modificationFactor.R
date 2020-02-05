#Modification Deduction
modificationFactor <- function(springMoisture, fallMoisture, 
                                  fallFrost, basicClimateRating){
  deduction <- ((springMoisture + fallMoisture + fallFrost) / 100) * basicClimateRating
  
  return(deduction)
}
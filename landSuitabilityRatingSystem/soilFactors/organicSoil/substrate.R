#February 21, 2020
#Hayden McAdam
#Calculates the substrate depth/type deduction (G) in organic soils (Table 5.9).
substrate <- function(cropType, ppe, organicDepth, masterHorizon, substrateCF, substrateSilt, substrateClay) {
  if (cropType == "SSSG") {
    pointDeduction <- ifelse(organicDepth >= 140, 0,
                             ifelse(masterHorizon == "R", ((120 - organicDepth) * 0.8) + (10 + (ppe / -15)),
                                    ifelse(masterHorizon == "CO", ((120 - organicDepth) * 0.7) + (5 + (ppe / -15)),
                                           ifelse(masterHorizon == "C" || masterHorizon == "A" && substrateCF >= 20, ((120 - organicDepth) * 0.6) + (ppe / -15),
                                                  ifelse(masterHorizon == "C" || masterHorizon == "A" && substrateCF < 20, (((100 - organicDepth) * 0.6) *
                                                    ((substrateSilt + substrateClay) / 80))(ppe / -15))))))
  }
  #Prevent negative deductions and deductions greater than 100 points.
  pointDeduction[pointDeduction<0] <- 0
  pointDeduction[pointDeduction>100] <- 100
  return(pointDeduction)
}
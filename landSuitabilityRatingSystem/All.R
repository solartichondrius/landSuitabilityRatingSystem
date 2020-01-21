# Title     : All
# Objective : Run all the scripts in this directory
# Created by: CurtisTh
# Created on: 2020-01-21

setwd("C:/Users/CurtisTh/PycharmProjects/untitled1/landSuitabilityRatingSystem")

source("climateRatingClass.R",echo=TRUE)
source("climateRatingPoints.R",echo=TRUE)
source("createDataFrame.R",echo=TRUE)
source("csvResults.R",echo=TRUE)
source("plotGraph.R",echo=TRUE)
#source("plotGraphs.R",echo=TRUE)
source("pointsToClass.R",echo=TRUE)

source("climaticFactors/AorPPE.R",echo=TRUE)
source("climaticFactors/excessFallMoisture.R",echo=TRUE)
source("climaticFactors/excessSpringMoisture.R",echo=TRUE)
source("climaticFactors/fallFrost.R",echo=TRUE)
source("climaticFactors/moistureFactor.R",echo=TRUE)
source("climaticFactors/temperatureFactor.R",echo=TRUE)

source("test.R",echo=TRUE)
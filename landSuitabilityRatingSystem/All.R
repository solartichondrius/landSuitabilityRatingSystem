# Title     : All
# Objective : Run all the scripts in this directory
# Created by: CurtisTh
# Created on: 2020-01-21

setwd("C:/Users/CurtisTh/PycharmProjects/untitled1/landSuitabilityRatingSystem")

source("createDataFrame.R",echo=TRUE)
source("plotGraph.R",echo=TRUE)
#source("plotGraphs.R",echo=TRUE)
source("pointsToClass.R",echo=TRUE)
source("results.R",echo=TRUE)

source("climaticFactors/AorPPE.R",echo=TRUE)
source("climaticFactors/climateRatingClass.R",echo=TRUE)
source("climaticFactors/climateRatingPoints.R",echo=TRUE)
source("climaticFactors/climateResults.R",echo=TRUE)
source("climaticFactors/excessFallMoisture.R",echo=TRUE)
source("climaticFactors/excessSpringMoisture.R",echo=TRUE)
source("climaticFactors/fallFrost.R",echo=TRUE)
source("climaticFactors/moistureFactor.R",echo=TRUE)
source("climaticFactors/temperatureFactor.R",echo=TRUE)

source("landscapeFactors/coarseFragmentContent.R",echo=TRUE)
source("landscapeFactors/flooding.R",echo=TRUE)
source("landscapeFactors/landscapeRatingClass.R",echo=TRUE)
source("landscapeFactors/landscapeRatingPoints.R",echo=TRUE)
source("landscapeFactors/landscapeResults.R",echo=TRUE)
source("landscapeFactors/region1AllSlopesAndRegion2ComplexSlopes.R",echo=TRUE)
source("landscapeFactors/region2SimpleSlope.R",echo=TRUE)
source("landscapeFactors/slope.R",echo=TRUE)
source("landscapeFactors/stoniness.R",echo=TRUE)
source("landscapeFactors/woodContent.R",echo=TRUE)

source("soilFactors/organicMatterContent.R",echo=TRUE)
source("soilFactors/organicSurface.R",echo=TRUE)
source("soilFactors/reaction.R",echo=TRUE)
source("soilFactors/salinity.R",echo=TRUE)
source("soilFactors/sodicity.R",echo=TRUE)
source("soilFactors/soilRatingClass.R",echo=TRUE)
source("soilFactors/soilRatingPoints.R",echo=TRUE)
source("soilFactors/soilTemperature.R",echo=TRUE)

#source("test.R",echo=TRUE)
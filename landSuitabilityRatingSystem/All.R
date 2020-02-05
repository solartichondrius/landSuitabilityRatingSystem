# Title     : All
# Objective : Run all the scripts in this directory
# Created by: CurtisTh
# Created on: 2020-01-21

source("loadFiles.R",echo=TRUE) #function I made to make it easier to load many files at once

loadFiles(ECHO=FALSE,reload=TRUE,

          "createDataFrame.R",
          "plotGraph.R",
          #"plotGraphs.R",
          "pointsToClass.R",
          "results.R",
          "loadRaster.R",

          "climaticFactors/AorPPE.R",
          "climaticFactors/climateRaster.R",
          "climaticFactors/climateRating.R",
          "climaticFactors/climateRatingClass.R",
          "climaticFactors/climateRatingPoints.R",
          "climaticFactors/climateResults.R",
          "climaticFactors/excessFallMoisture.R",
          "climaticFactors/excessSpringMoisture.R",
          "climaticFactors/fallFrost.R",
          "climaticFactors/moistureFactor.R",
          "climaticFactors/temperatureFactor.R",

          "landscapeFactors/landscapeRatingClass.R",
          "landscapeFactors/landscapeRatingPoints.R",
          "landscapeFactors/landscapeResults.R",
          #"landscapeFactors/region1AllSlopesAndRegion2ComplexSlopes.R",
          #"landscapeFactors/region2SimpleSlope.R",
          #"landscapeFactors/slope.R",
          "landscapeFactors/stoniness.R",
          "landscapeFactors/woodContent.R",

          "soilFactors/organicMatterContent.R",
          "soilFactors/organicSurface.R",
          "soilFactors/reaction.R",
          "soilFactors/salinity.R",
          "soilFactors/sodicity.R",
          "soilFactors/soilRatingClass.R",
          "soilFactors/soilRatingPoints.R",
          "soilFactors/soilTemperature.R"

)
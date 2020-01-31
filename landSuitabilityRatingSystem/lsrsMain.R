#INCOMPLETE
#January 24, 2020
#Hayden McAdam
#Read in and clean vector data and call functions to calculate points for
#climate, landscape, and soil factors.

#TODO: 
#Add climate and soil data and functions into this file to be processed
#with the landscape data.
#Correct column names to match the real data.
#Calculate the region value in the topography function 
#using slope length (Figure 6.1).

library(foreign)

loadFiles("landscapeFactors/landscapeRatingPoints.R","landscapeFactors/landscapeRatingClass.R","climaticFactors/climateRatingPoints.R")



lsTable <- read.csv("./landscapeTest2.csv")
#lsTable <- read.dbf("../../ab_vector/CFR_slc32_250m.dbf")
#lsTable <- read.dbf("../../ab_vector/ab_rasterized_slc32_250m.dbf")

clTable <- read.csv("../../ab_vector/climate1981x10_CCCS_baseline.csv")

#lsTable <- subset(lsTable, ps >= 0 & lt != "" & s >= 0 & cf >= 0)

lsTable$points <- landscapeRatingPoints(lsTable$region, lsTable$ps,
                       lsTable$lt, lsTable$cf,lsTable$surface, 
                       lsTable$subsurface, lsTable$pattern, 
                       lsTable$inundationPeriod,
                       lsTable$usableGrowingSeasonLength, lsTable$frequency)

lsTable <- subset(lsTable, points >= 0 & points <= 100)

lsTable$class <- landscapeRatingClass(lsTable$region, lsTable$ps,
                       lsTable$lt, lsTable$cf,
                       lsTable$surface, lsTable$subsurface,
                       lsTable$pattern, lsTable$inundationPeriod,
                       lsTable$usableGrowingSeasonLength, lsTable$frequency,
                       lsTable$points)

clTable <- clTable[c("slc", "ppe", "egdd", "esm", "efm", "eff")]

clTable$points <- climateRatingPoints(clTable$ppe, clTable$egdd, clTable$esm,
                                      clTable$efm, clTable$eff)


clTable <- subset(clTable, points >= 0 & points <= 100)

#write.csv(lsTable, file="testResults.csv", row.names=FALSE)
#write.csv(clTable, file="climateResults.csv", row.names=FALSE)

#NOTE: I haven't seen any results from the web app that had any pattern value
#other than 0 or a flooding value other than 1. 
#I'm not sure if this variable is used in the calculations at all.
#The test code has these values set to 0 or 1 respectively 
#in all records for now.

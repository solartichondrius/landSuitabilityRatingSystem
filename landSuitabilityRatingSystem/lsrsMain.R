#INCOMPLETE
#January 24, 2020
#Hayden McAdam
#Read in and clean vector data and call all necessary functions.
source("landscapeFactors/landscapeRatingPoints.R")
source("landscapeFactors/landscapeRatingClass.R")

#lsTable <- read.csv("./landscapeTest.csv")
clTable <- read.csv("../../ab_vector/climate1981x10_CCCS_baseline.csv")

#lsTable <- subset(lsTable, ps >= 0 & lt != "" & s >= 0 & cf >= 0)

# lsTable$points <- 0

# lsTable$points <- landscapeRatingPoints(lsTable$region, lsTable$ps,
#                        lsTable$lt, lsTable$s, lsTable$cf,
#                        lsTable$surface, lsTable$subsurface,
#                        lsTable$pattern, lsTable$inundationPeriod,
#                        lsTable$usableGrowingSeasonLength, lsTable$frequency) + 100

#lsTable <- subset(lsTable, points >= 0 & points <= 100)

# lsTable$class <- landscapeRatingClass(lsTable$region, lsTable$ps,
#                        lsTable$lt, lsTable$s, lsTable$cf,
#                        lsTable$surface, lsTable$subsurface,
#                        lsTable$pattern, lsTable$inundationPeriod,
#                        lsTable$usableGrowingSeasonLength, lsTable$frequency)

clTable$points <- climateRatingPoints(clTable$ppe, clTable$egdd, clTable$esm, 
                                      clTable$efm, clTable$eff)
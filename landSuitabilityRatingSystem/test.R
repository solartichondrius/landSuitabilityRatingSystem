# Title     : Test
# Objective : test the csv results function using a csv file
# Created by: CurtisTh
# Created on: 2020-01-21
#source("All.R")
#results("O:/Temporary/lsrs/test_data/ab_vector/climate1981x10_CCCS_baseline.csv","O:/Temporary/lsrs/test_data/ab_vector/climate1981x10_CCCS_baseline_testResults_new.csv")
library(raster)
test <- na.omit(as.data.frame(raster("O:/Temporary/lsrs/test_data/ab_raster/AB_EGDD_250m_lcc.tif")))
test
#head(test)
#plot(test)
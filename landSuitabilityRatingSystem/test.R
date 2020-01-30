# Title     : Test
# Objective : test the csv results function using a csv file
# Created by: CurtisTh
# Created on: 2020-01-21

#results("O:/Temporary/lsrs/test_data/ab_vector/climate1981x10_CCCS_baseline.csv","O:/Temporary/lsrs/test_data/ab_vector/climate1981x10_CCCS_baseline_testResults.csv")
library(raster)
testRaster <- raster("O:/Temporary/lsrs/test_data/ab_raster/Alberta_250mslc32grid_lcc.tif")
testRaster
plot(testRaster)

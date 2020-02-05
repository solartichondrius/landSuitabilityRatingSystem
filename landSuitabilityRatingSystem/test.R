# Title     : Test
# Objective : test the csv results function using a csv file
# Created by: CurtisTh
# Created on: 2020-01-21
#setwd("landSuitabilityRatingSystem")
source("All.R")
#results("O:/Temporary/lsrs/test_data/ab_vector/climate1981x10_CCCS_baseline.csv",output="O:/Temporary/lsrs/test_data/ab_vector/climate1981x10_CCCS_baseline_testResults_vector.csv")
results(
  "O:/Temporary/lsrs/test_data/ab_raster/AB_PPE_250m_lcc.tif",
  "O:/Temporary/lsrs/test_data/ab_raster/AB_PPE_250m_lcc.tif",
  "O:/Temporary/lsrs/test_data/ab_raster/AB_PPE_250m_lcc.tif",
  "O:/Temporary/lsrs/test_data/ab_raster/AB_EGDD_250m_lcc.tif",
  "O:/Temporary/lsrs/test_data/ab_raster/Alberta_250mslc32grid_lcc.tif",
  output="O:/Temporary/lsrs/test_data/ab_vector/climate1981x10_CCCS_baseline_testResults_raster.csv"
)

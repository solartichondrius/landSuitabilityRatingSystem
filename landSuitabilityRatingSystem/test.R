# Title     : Test
# Objective : test the csv results function using a csv file
# Created by: CurtisTh
# Created on: 2020-01-21
#setwd("landSuitabilityRatingSystem")
source("All.R")
#results(
#  climateIN="O:/Temporary/lsrs/test_data/ab_vector/climate1981x10_CCCS_baseline.csv",
#  climateOUT="O:/Temporary/lsrs/test_data/ab_vector/climate1981x10_CCCS_baseline_testResults_vector.csv",
#  landscapeIN="O:/Temporary/lsrs/test_data/ab_vector/landscapeTest2.csv",
#  landscapeOUT="O:/Temporary/lsrs/test_data/ab_vector/landscapeTest2_vector.csv"
#)
results(climateOUT="O:/Temporary/lsrs/test_data/ab_vector/climate1981x10_CCCS_baseline_testResults_raster.csv",
  climateIN=c("O:/Temporary/lsrs/test_data/ab_raster/AB_PPE_250m_lcc.tif",
            "O:/Temporary/lsrs/test_data/ab_raster/AB_PPE_250m_lcc.tif",
            "O:/Temporary/lsrs/test_data/ab_raster/AB_PPE_250m_lcc.tif",
            "O:/Temporary/lsrs/test_data/ab_raster/AB_EGDD_250m_lcc.tif",
            "O:/Temporary/lsrs/test_data/ab_raster/Alberta_250mslc32grid_lcc.tif")
)

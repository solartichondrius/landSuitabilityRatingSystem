# Title     : Plot Graphs
# Objective : Plots the graphs of the climatic factors
# Created by: CurtisTh
# Created on: 2020-01-20

#Figure 3.1: Point Deductions for moisture index values for spring-seeded small grains
plotGraph(createDataFrame(moistureFactor,-500,0),"Point Deductions for moisture index values for spring-seeded small grains","Point Deduction","P-PE(mm)")

#Figure 3.2: Point deductions for effective growing degree day (EGDD) values for spring-seeded small grains.
plotGraph(createDataFrame(temperatureFactor,600,1600),"Point deductions for effective growing degree day (EGDD) values for spring-seeded small grains.","Point Deduction","EGDD")

#Figure 3.3: Percent defuction for P-PE (May)
plotGraph(createDataFrame(excessSpringMoisture,-50,50),"Percent deduction for P-PE (May)","Percent Deduction","P=PE(mm) for May")

#Figure 3.4: Percent deduction for P-PE (September)
plotGraph(createDataFrame(excessFallMoisture,0,100),"Percent deduction for P-PE (September)","Percent Deduction","P=PE(mm) for September")

#Figure 3.5 Percent deduction for early frost.
plotGraph(createDataFrame(fallFrost,0,30),"Percent deduction for early frost","Percent Deduction","Days before Average Fall Frost")

#Figure 6.2: Deductions related to slope gradient for all landscape types in Region 1 and for landscapes with complex slopes in Region 2.
plotGraph(createDataFrame(region1AllSlopesAndRegion2ComplexSlopes,0,70),"Deductions related to slope gradient for all landscape types in Region 1 and for landscapes with complex slopes in Region 2.","Deduction Points","Percent Slope")

#Figure 6.3: Deductions related to slope gradient for landscapes with simple slopes in Region 2.
plotGraph(createDataFrame(region2SimpleSlope,0,70),"Deductions related to slope gradient for landscapes with simple slopes in Region 2.","Deduction Points","Percent Slope")

#Figure 6.4 Deductions for surface stoniness.
plotGraph(createDataFrame(stoniness,0,2),"Deductions for surface stoniness.","Percent Deduction","Annual Removal(cubic m/ha)")

#Figure 6.5 Deductions for coarse fragment (gravel) content.
plotGraph(createDataFrame(stoniness,10,50),"Deductions for coarse fragment (gravel) content.","Percent Deduction","Coarse Frament Content(% vol)")



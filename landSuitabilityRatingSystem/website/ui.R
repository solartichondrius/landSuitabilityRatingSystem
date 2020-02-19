# Title     : UI
# Objective : Code for the UI (User Interface) for the website
# Created by: test
# Created on: 2020-02-19

library(shiny)

ui <- fluidPage( #code for the webpage's UI (user interface)
  titlePanel("Land Suitability Rating System"), #title at the top of the page
  selectInput(inputId = "cropType", label = "Crop type:", choices = c( #user can select one item from a list in a drop-down box
    "Alfalfa" = "Alfalfa", "Brome" = "Brome", "Canola" = "Canola", "Spring Seeded Small Grains" = "SSSG", "Corn" = "Corn", "Soybean" = "Soybean", "Potatoes" = "Potatoes"
  ), selected = "SSSG"), #Spring Seeded Small Grain is selected by default since it is the only one we are working with right now
  radioButtons(inputId = "fileType", label = "File Type:", choices = c("Vector" = "Vector","Raster" = "Raster")), #user can select one radio button
  radioButtons(inputId = "dataType", label = "Type of Data:", choices = c("Climate" = "Climate","Landscape" = "Landscape", "Soil" = "Soil")), #user can select one radio button

  conditionalPanel(condition = "input.fileType == 'Vector'", #if the vector file type radio button is selected create a panel containing the following
                   fileInput(inputId = "vectorFile", label = "Choose a vector file:", multiple = FALSE) #lets user select a vector file
  ),
  conditionalPanel(condition = "input.fileType == 'Raster' && input.dataType == 'Climate'", #if the raster file type radio button and climate radio button are selected create a panel containing the following
                   fileInput(inputId = "PPE", label = "Choose a raster file for PPE (Precipitation-Potential Evapotranspiration):", multiple = FALSE),
                   fileInput(inputId = "springPPE", label = "Choose a raster file for Spring PPE (Precipitation-Potential Evapotranspiration):", multiple = FALSE),
                   fileInput(inputId = "fallPPE", label = "Choose a raster file for Fall PPE (Precipitation-Potential Evapotranspiration):", multiple = FALSE),
                   fileInput(inputId = "EGDD", label = "Choose a raster file for EGDD (Effective Growing Degree Days):", multiple = FALSE),
                   fileInput(inputId = "DBAFF", label = "Choose a raster file for The Number of Days Before Average Fall Frost:", multiple = FALSE)
  ),
  conditionalPanel(condition = "input.fileType == 'Raster' && input.dataType == 'Landscape'", #if the raster file type radio button and landscape radio button are selected create a panel containing the following
                   fileInput(inputId = "region", label = "Choose a raster file for region:", multiple = FALSE),
                   fileInput(inputId = "percentSlope", label = "Choose a raster file for percent slope:", multiple = FALSE),
                   fileInput(inputId = "landscapeType", label = "Choose a raster file for landscape type:", multiple = FALSE),
                   fileInput(inputId = "coarseFragments", label = "Choose a raster file for coarse fragments:", multiple = FALSE),
                   fileInput(inputId = "surface", label = "Choose a raster file for surface wood content:", multiple = FALSE),
                   fileInput(inputId = "subsurface", label = "Choose a raster file for subsurface wood content:", multiple = FALSE),
                   fileInput(inputId = "pattern", label = "Choose a raster file for pattern:", multiple = FALSE),
                   fileInput(inputId = "inundationPeriod", label = "Choose a raster file for inundation period:", multiple = FALSE),
                   fileInput(inputId = "usableGrowingSeasonLength", label = "Choose a raster file for usable growing season length:", multiple = FALSE),
                   fileInput(inputId = "frequency", label = "Choose a raster file for frequency of flooding:", multiple = FALSE),
  ),
  conditionalPanel(condition = "input.fileType == 'Raster' && input.dataType == 'Soil'", #if the raster file type radio button and soil radio button are selected create a panel containing the following
                   #TODO: put file input boxes here for all of the soil attributes
  ),
  textInput(inputId = "fileOutput", label = "Choose where to save the results:"), #user can type in the full path for where they want to save the results
  actionButton(inputId = "processFile", label = "Process File"), #click this button to run the code to process the file and save the results
  tableOutput("table") #table to put a preview of the results file (the head, which is the first 6 rows)
)
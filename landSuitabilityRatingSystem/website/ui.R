# Title     : UI
# Objective : Code for the UI (User Interface) for the website
# Created by: test
# Created on: 2020-02-19

library(shiny)
library(shinyjs)

ui <- fluidPage( #code for the webpage's UI (user interface)
  shinyjs::useShinyjs(), #use shiny javascript functions
  titlePanel("Land Suitability Rating System"), #title at the top of the page
  selectInput(inputId = "cropType", label = "Crop type:", choices = c( #user can select one item from a list in a drop-down box
    "Alfalfa" = "Alfalfa", "Brome" = "Brome", "Canola" = "Canola", "Spring Seeded Small Grains" = "SSSG", "Corn" = "Corn", "Soybean" = "Soybean", "Potatoes" = "Potatoes"
  ), selected = "SSSG"), #Spring Seeded Small Grain is selected by default since it is the only one we are working with right now
  radioButtons(inputId = "fileType", label = "File Type:", choices = c("Vector" = "Vector","Raster" = "Raster")), #user can select one radio button
  radioButtons(inputId = "dataType", label = "Type of Data:", choices = c("Climate" = "Climate","Landscape" = "Landscape", "Soil" = "Soil")), #user can select one radio button

  conditionalPanel(condition = "input.fileType == 'Vector'", uiOutput("vectorFiles")),

  conditionalPanel(condition = "input.fileType == 'Raster' && input.dataType == 'Climate'", #if the raster file type radio button and climate radio button are selected create a dropdown box containing the following
                   uiOutput("PPERaster"),
                   uiOutput("springPPERaster"),
                   uiOutput("fallPPERaster"),
                   uiOutput("EGDDRaster"),
                   uiOutput("DBAFFRaster")
  ),
  conditionalPanel(condition = "input.fileType == 'Raster' && input.dataType == 'Landscape'", #if the raster file type radio button and landscape radio button are selected create a panel containing the following
                   uiOutput("regionRaster"),
                   uiOutput("percentSlopeRaster"),
                   uiOutput("landscapeTypeRaster"),
                   uiOutput("coarseFragmentsRaster"),
                   uiOutput("surfaceRaster"),
                   uiOutput("subsurfaceRaster"),
                   uiOutput("patternRaster"),
                   uiOutput("inundationPeriodRaster"),
                   uiOutput("usableGrowingSeasonLengthRaster"),
                   uiOutput("frequencyRaster")
  ),
  # conditionalPanel(condition = "input.fileType == 'Raster' && input.dataType == 'Soil'", #if the raster file type radio button and soil radio button are selected create a panel containing the following
  #                  uiOutput("claySurfaceRaster"),
  #                  uiOutput("claySubsurfaceRaster"),
  #                  uiOutput("sandSurfaceRaster"),
  #                  uiOutput("sandSubsurfaceRaster"),
  #                  uiOutput("siltSurfaceRaster"),
  #                  uiOutput("siltSubsurfaceRaster"),
  #                  uiOutput("cfSurfaceRaster"),
  #                  uiOutput("cfSubsurfaceRaster"),
  #                  uiOutput("awhcSurfaceRaster"),
  #                  uiOutput("awhcSubsurfaceRaster"),
  #                  uiOutput("ppeRaster"),
  #                  uiOutput("ocSurfacePercRaster"),
  #                  uiOutput("surfacePHRaster"),
  #                  uiOutput("subsurfacePHRaster"),
  #                  uiOutput("surfaceECRaster"),
  #                  uiOutput("subsurfaceECRaster"),
  #                  uiOutput("sarSurfaceRaster"),
  #                  uiOutput("sarSubsurfaceRaster"),
  #                  uiOutput("E_DEPTHRaster"),
  #                  uiOutput("bdRaster")
  # ),
  textInput(inputId = "fileOutput", label = "Choose a name for the output file:"), #user can type in the full path for where they want to save the results
  actionButton(inputId = "processFile", label = "Process File"), #click this button to run the code to process the file and save the results
  downloadButton("Download"), #button to download the processed results file
  tableOutput("table") #table to put a preview of the results file (the head, which is the first 6 rows)
)
# Title     : UI
# Objective : Code for the UI (User Interface) for the website
# Created by: test
# Created on: 2020-02-19

library(shiny)
library(shinyjs)

ui <- fluidPage( 
  #use shiny javascript functions
  shinyjs::useShinyjs(),
  titlePanel("Land Suitability Rating System"), 
  #Spring Seeded Small Grain is selected by default since it is the only one we are working with right now
  selectInput(inputId = "cropType", label = "Crop type:", choices = c( "Alfalfa" = "Alfalfa", 
    "Brome" = "Brome", "Canola" = "Canola", "Spring Seeded Small Grains" = "SSSG", "Corn" = "Corn", 
    "Soybean" = "Soybean", "Potatoes" = "Potatoes"), selected = "SSSG"),
  radioButtons(inputId = "fileType", label = "File Type:", choices = c("Vector" = "Vector","Raster" = "Raster")),
  radioButtons(inputId = "dataType", label = "Type of Data:", choices = c("Climate" = "Climate","Landscape" = "Landscape", "Soil" = "Soil")),

  conditionalPanel(condition = "input.fileType == 'Vector'", uiOutput("vectorFiles")),

  #Create dropdown menus for selecting climate, landscape, or soil data
  #depending on the selected radio buttons.
  conditionalPanel(condition = "input.fileType == 'Raster' && input.dataType == 'Climate'", 
                   uiOutput("PPERaster"),
                   uiOutput("springPPERaster"),
                   uiOutput("fallPPERaster"),
                   uiOutput("EGDDRaster"),
                   uiOutput("DBAFFRaster")
  ),conditionalPanel(condition = "input.fileType == 'Raster' && input.dataType == 'Landscape'", 
                   uiOutput("regionRaster"),
                   uiOutput("percentSlopeRaster"),
                   uiOutput("landscapeTypeRaster"),
                   uiOutput("coarseFragmentsRaster"),
                   uiOutput("surfaceRaster"),
                   uiOutput("subsurfaceRaster"),
                   uiOutput("patternRaster"),
                   uiOutput("inundationRaster"),
                   uiOutput("ugslRaster"),
                   uiOutput("floodFreqRaster")
  ),conditionalPanel(condition = "input.fileType == 'Raster' && input.dataType == 'Soil'", 
                   uiOutput("soilTypeRaster"),
                   uiOutput("claySurfaceRaster"),
                   uiOutput("claySubsurfaceRaster"),
                   uiOutput("siltSurfaceRaster"),
                   uiOutput("siltSubsurfaceRaster"),
                   uiOutput("cfSurfaceRaster"),
                   uiOutput("cfSubsurfaceRaster"),
                   uiOutput("ppeRaster"),
                   uiOutput("ocSurfacePercRaster"),
                   uiOutput("surfacePHRaster"),
                   uiOutput("subsurfacePHRaster"),
                   uiOutput("surfaceECRaster"),
                   uiOutput("subsurfaceECRaster")
  ),
  textInput(inputId = "fileOutput", label = "Choose a name for the output file:"), #user can type in the full path for where they want to save the results
  actionButton(inputId = "processFile", label = "Process File"), #click this button to run the code to process the file and save the results
  downloadButton("Download"), #button to download the processed results file
  tableOutput("table") #table to put a preview of the results file (the head, which is the first 6 rows)
)
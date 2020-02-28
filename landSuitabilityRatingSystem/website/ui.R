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
                   fileInput(inputId = "region", label = "Choose a raster file for region:", multiple = FALSE),
                   fileInput(inputId = "percentSlope", label = "Choose a raster file for percent slope:", multiple = FALSE),
                   fileInput(inputId = "landscapeType", label = "Choose a raster file for landscape type:", multiple = FALSE),
                   fileInput(inputId = "coarseFragments", label = "Choose a raster file for coarse fragments:", multiple = FALSE),
                   fileInput(inputId = "surface", label = "Choose a raster file for surface wood content:", multiple = FALSE),
                   fileInput(inputId = "subsurface", label = "Choose a raster file for subsurface wood content:", multiple = FALSE),
                   fileInput(inputId = "pattern", label = "Choose a raster file for pattern:", multiple = FALSE),
                   fileInput(inputId = "inundationPeriod", label = "Choose a raster file for inundation period:", multiple = FALSE),
                   fileInput(inputId = "usableGrowingSeasonLength", label = "Choose a raster file for usable growing season length:", multiple = FALSE),
                   fileInput(inputId = "frequency", label = "Choose a raster file for frequency of flooding:", multiple = FALSE)
  ),
  conditionalPanel(condition = "input.fileType == 'Raster' && input.dataType == 'Soil'", #if the raster file type radio button and soil radio button are selected create a panel containing the following
                   fileInput(inputId = "claySurface", label = "Choose a file for claySurface:", multiple = FALSE),
                   fileInput(inputId = "claySubsurface", label = "Choose a file for claySubsurface:", multiple = FALSE),
                   fileInput(inputId = "sandSurface", label = "Choose a file for sandSurface:", multiple = FALSE),
                   fileInput(inputId = "sandSubsurface", label = "Choose a file for sandSubsurface:", multiple = FALSE),
                   fileInput(inputId = "siltSurface", label = "Choose a file for siltSurface:", multiple = FALSE),
                   fileInput(inputId = "siltSubsurface", label = "Choose a file for siltSubsurface:", multiple = FALSE),
                   fileInput(inputId = "cfSurface", label = "Choose a file for cfSurface:", multiple = FALSE),
                   fileInput(inputId = "cfSubsurface", label = "Choose a file for cfSubsurface:", multiple = FALSE),
                   fileInput(inputId = "awhcSurface", label = "Choose a file for awhcSurface:", multiple = FALSE),
                   fileInput(inputId = "awhcSubsurface", label = "Choose a file for awhcSubsurface:", multiple = FALSE),
                   fileInput(inputId = "ppe", label = "Choose a file for ppe:", multiple = FALSE),
                   fileInput(inputId = "ocSurfacePerc", label = "Choose a file for ocSurfacePerc:", multiple = FALSE),
                   fileInput(inputId = "surfacePH", label = "Choose a file for surfacePH:", multiple = FALSE),
                   fileInput(inputId = "subsurfacePH", label = "Choose a file for subsurfacePH:", multiple = FALSE),
                   fileInput(inputId = "surfaceEC", label = "Choose a file for surfaceEC:", multiple = FALSE),
                   fileInput(inputId = "subsurfaceEC", label = "Choose a file for subsurfaceEC:", multiple = FALSE),
                   fileInput(inputId = "sarSurface", label = "Choose a file for sarSurface:", multiple = FALSE),
                   fileInput(inputId = "sarSubsurface", label = "Choose a file for sarSubsurface:", multiple = FALSE),
                   fileInput(inputId = "E_DEPTH", label = "Choose a file for E_DEPTH:", multiple = FALSE),
                   fileInput(inputId = "bd", label = "Choose a file for bd:", multiple = FALSE)
  ),
  textInput(inputId = "fileOutput", label = "Choose a name for the output file:"), #user can type in the full path for where they want to save the results
  actionButton(inputId = "processFile", label = "Process File"), #click this button to run the code to process the file and save the results
  downloadButton("Download"), #button to download the processed results file
  #tableOutput("table") #table to put a preview of the results file (the head, which is the first 6 rows)
  DT::dataTableOutput("table")
)
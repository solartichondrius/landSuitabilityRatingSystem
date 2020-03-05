# Title     : Server
# Objective : Code for the server for the website
# Created by: test
# Created on: 2020-02-19

library(shiny)
library(shinyjs)

server <- function(input,output){ #code which runs on the server
  shinyjs::useShinyjs() #use shiny javascript functions
  options(shiny.maxRequestSize=2^32) #Allows files up to 4GB (default limit was only 5MB)
  homePath <- "D:/lsrsHayden/landSuitabilityRatingSystem/landSuitabilityRatingSystem" #where this project is located on the filesystem
  vectorPath <- paste0(homePath,"/../../ab_vector/") #where all the vector files are located on the filesystem
  rasterPath <- paste0(homePath, "/../../ab_raster/") #where all the raster files are located on the filesystem
  resultsPath <- paste0(homePath, "/dataFiles/test_data/") #where all the results files are located on the filesystem
  if(getwd() != homePath){ #if we are not currently in the correct directory
    setwd(homePath) #then put us in the correct directory
  }
  source("landscapeFactors/landscapeRating.R")
  source("landscapeFactors/landscapeResults.R")
  source("landscapeFactors/topography.R")
  source("landscapeFactors/stoniness.R")
  source("landscapeFactors/woodContent.R")
  source("landscapeFactors/flooding.R")
  source("pointsToClass.R")
  source("results.R")
  source("climaticFactors/climateRatingPoints.R")
  source("climaticFactors/climateRatingClass.R")
  source("climaticFactors/climateRating.R")
  source("climaticFactors/climateResults.R")
  source("climaticFactors/moistureFactor.R")
  source("climaticFactors/temperatureFactor.R")
  source("climaticFactors/excessSpringMoisture.R")
  source("climaticFactors/excessFallMoisture.R")
  source("climaticFactors/fallFrost.R")
  #source("All.R") #load all the required files

  output$vectorFiles <- renderUI({selectInput(inputId = "vectorFile",  label = "Choose a vector file:", list.files(vectorPath,"\\.csv$"))})
  outputOptions(output, "vectorFiles", suspendWhenHidden = FALSE)

  output$climateRaster <- renderUI({selectInput(inputId = "climateRaster", label = "Select a climate scenario:", "AB_250m")})
  outputOptions(output, "climateRaster", suspendWhenHidden = FALSE)
  # output$PPERaster <- renderUI({selectInput(inputId = "PPE", label = "Choose a raster file for PPE (Precipitation-Potential Evapotranspiration):", list.files(paste0(rasterPath,"climate/PPE"),"\\.tif$"))})
  # outputOptions(output, "PPERaster", suspendWhenHidden = FALSE)
  # output$springPPERaster <- renderUI({selectInput(inputId = "springPPE", label = "Choose a raster file for Spring PPE (Precipitation-Potential Evapotranspiration):", list.files(paste0(rasterPath,"climate/springPPE"),"\\.tif$"))})
  # outputOptions(output, "springPPERaster", suspendWhenHidden = FALSE)
  # output$fallPPERaster <- renderUI({selectInput(inputId = "fallPPE", label = "Choose a raster file for Fall PPE (Precipitation-Potential Evapotranspiration):", list.files(paste0(rasterPath,"climate/fallPPE"),"\\.tif$"))})
  # outputOptions(output, "fallPPERaster", suspendWhenHidden = FALSE)
  # output$EGDDRaster <- renderUI({selectInput(inputId = "EGDD", label = "Choose a raster file for EGDD (Effective Growing Degree Days):", list.files(paste0(rasterPath,"climate/EGDD"),"\\.tif$"))})
  # outputOptions(output, "EGDDRaster", suspendWhenHidden = FALSE)
  # output$DBAFFRaster <- renderUI({selectInput(inputId = "DBAFF", label = "Choose a raster file for The Number of Days Before Average Fall Frost:", list.files(paste0(rasterPath,"climate/DBAFF"),"\\.tif$"))})
  # outputOptions(output, "DBAFFRaster", suspendWhenHidden = FALSE)

  observeEvent(eventExpr = input[["processFile"]],handlerExpr = { #runs the following code after the action button is pushed
    fileName <- paste0(input$fileOutput,".csv") #add the .csv extension to the end of the file name
    fileOUT <- paste0(resultsPath,fileName) #full path of the output file
    
    if(input$climateRaster == "AB_250m"){
      # PPE <- rasterPath + "climate/PPE/AB_PPE_250m_lcc.tif"
      # springPPE <- rasterPath + "climate/springPPE/ab_250m_climate_esm_lcc.tif"
      # fallPPE <- rasterPath + "climate/fallPPE/ab_250m_climate_fsm_lcc.tif"
      # EGDD <- rasterPath + "climate/EGDD/AB_EGDD_250m_lcc.tif"
      # DBAFF <- rasterPath + "AB_ALL_0.tif
      PPE <- paste0(rasterPath, "AB_PPE_250m_lcc.tif")
      springPPE <- paste0(rasterPath, "ab_250m_climate_esm_lcc.tif")
      fallPPE <- paste0(rasterPath, "ab_250m_climate_fsm_lcc.tif")
      EGDD <- paste0(rasterPath, "AB_EGDD_250m_lcc.tif")
      #DBAFF <- NA
    }
    
    withProgress(message="Processing file:",value=0, { #track the progress of the following code
      if(input$fileType == "Vector"){ #if the selected file type is Vector then
        results(input$dataType, "Vector", input$cropType, paste0(vectorPath,input$vectorFile), fileOUT) #process the input file and save the results to the output file
      } else { #if the selected file type is Raster then
        if(input$dataType == "Climate"){ #if the climate data type is selected then
          results("Climate", "Raster", input$cropType, c(PPE,springPPE,fallPPE,EGDD), fileOUT) #process the input file and save the results to the output file
        }
        if(input$dataType == "Landscape"){ #if the landscape data type is selected then
          results("Landscape", "Raster", input$cropType,
                  c(input$region,input$percentSlope,input$landscapeType,input$coarseFragments,input$surface,input$subsurface,input$pattern,input$inundationPeriod,input$usableGrowingSeasonLength,input$frequency),
                  fileOUT) #process the input file and save the results to the output file
        }
        if(input$dataType == "Soil"){ #if the soil data type is selected then
          results("Soil","Raster", input$cropType,
          c(input$claySurface,input$claySubsurface,input$sandSurface,input$sandSubsurface,input$siltSurface,input$siltSubsurface,input$cfsurface,input$cdSubsurface,input$awhcSurface,input$awhcSubsurface,input$ppe,
          input$ocSurfacePerc,input$surfacePH,input$subsurfacePH,input$surfaceEC,input$subsurfaceEC,input$sarSurface,input$sarSubsurface,input$E_DEPTH,input$bd),
                  fileOUT)
        }
      }
    })
    shinyjs::enable("Download") #enable the download button
    output$Download <- downloadHandler(filename = fileName, content = function(file) { write.csv(read.csv(fileOUT), file, row.names = TRUE)}) #allows the file to be downloaded
    #output$table <- renderTable({head(read.csv(fileOUT))}) #display a table with a preview of the results file (the head, which is the first 6 rows)
    # output$table <- DT::renderDataTable({
    #   DT::datatable(read.csv(fileOUT), options = list(lengthMenu = c(25, 50, 100), pageLength = 25))
    # })
  })
  shinyjs::disable("Download") #disable the download button until there's a file processed
}
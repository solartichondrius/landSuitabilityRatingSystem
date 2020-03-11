# Title     : Server
# Objective : Code for the server for the website
# Created by: test
# Created on: 2020-02-19

library(shiny)
library(shinyjs)
library(raster)

server <- function(input,output){ #code which runs on the server
  shinyjs::useShinyjs() #use shiny javascript functions
  options(shiny.maxRequestSize=2^32) #Allows files up to 4GB (default limit was only 5MB)
  homePath <- "/home/test/PycharmProjects/landSuitabilityRatingSystem/landSuitabilityRatingSystem" #where this project is located on the filesystem
  vectorPath <- paste0(homePath,"/dataFiles/test_data/ab_vector/") #where all the vector files are located on the filesystem
  rasterPath <- paste0(homePath, "/dataFiles/test_data/ab_raster/") #where all the raster files are located on the filesystem
  resultsPath <- paste0(homePath, "/dataFiles/test_data/results/") #where all the results files are located on the filesystem
  if(getwd() != homePath){ #if we are not currently in the correct directory
    setwd(homePath) #then put us in the correct directory
  }
  source("loadAllFiles.R") #load all the required files

  output$vectorFiles <- renderUI({selectInput(inputId = "vectorFile",  label = "Choose a vector file:", list.files(vectorPath,"\\.csv$"))})
  outputOptions(output, "vectorFiles", suspendWhenHidden = FALSE) #dropbox to select one of the vector files from the server

  #Dropboxes for selecting climate raster files from the server:
  output$PPERaster <- renderUI({selectInput(inputId = "PPE", label = "Choose a raster file for PPE (Precipitation-Potential Evapotranspiration):", list.files(paste0(rasterPath,"climate/PPE"),"\\.tif$"))})
  outputOptions(output, "PPERaster", suspendWhenHidden = FALSE)
  output$springPPERaster <- renderUI({selectInput(inputId = "springPPE", label = "Choose a raster file for Spring PPE (Precipitation-Potential Evapotranspiration):", list.files(paste0(rasterPath,"climate/springPPE"),"\\.tif$"))})
  outputOptions(output, "springPPERaster", suspendWhenHidden = FALSE)
  output$fallPPERaster <- renderUI({selectInput(inputId = "fallPPE", label = "Choose a raster file for Fall PPE (Precipitation-Potential Evapotranspiration):", list.files(paste0(rasterPath,"climate/fallPPE"),"\\.tif$"))})
  outputOptions(output, "fallPPERaster", suspendWhenHidden = FALSE)
  output$EGDDRaster <- renderUI({selectInput(inputId = "EGDD", label = "Choose a raster file for EGDD (Effective Growing Degree Days):", list.files(paste0(rasterPath,"climate/EGDD"),"\\.tif$"))})
  outputOptions(output, "EGDDRaster", suspendWhenHidden = FALSE)
  output$DBAFFRaster <- renderUI({selectInput(inputId = "DBAFF", label = "Choose a raster file for The Number of Days Before Average Fall Frost:", list.files(paste0(rasterPath,"climate/DBAFF"),"\\.tif$"))})
  outputOptions(output, "DBAFFRaster", suspendWhenHidden = FALSE)

  #Dropboxes for selecting landscape raster files from the server:
  output$regionRaster <- renderUI({selectInput(inputId = "region", label = "Choose a raster file for region:", list.files(paste0(rasterPath,"landscape/region"),"\\.tif$"))})
  outputOptions(output, "regionRaster", suspendWhenHidden = FALSE)
  output$percentSlopeRaster <- renderUI({selectInput(inputId = "percentSlope", label = "Choose a raster file for percent slope:", list.files(paste0(rasterPath,"landscape/percentSlope"),"\\.tif$"))})
  outputOptions(output, "percentSlopeRaster", suspendWhenHidden = FALSE)
  output$landscapeTypeRaster <- renderUI({selectInput(inputId = "landscapeType", label = "Choose a raster file for landscape type:", list.files(paste0(rasterPath,"landscape/landscapeType"),"\\.tif$"))})
  outputOptions(output, "landscapeTypeRaster", suspendWhenHidden = FALSE)
  output$coarseFragmentsRaster <- renderUI({selectInput(inputId = "coarseFragments", label = "Choose a raster file for coarse fragments:", list.files(paste0(rasterPath,"landscape/coarseFragments"),"\\.tif$"))})
  outputOptions(output, "coarseFragmentsRaster", suspendWhenHidden = FALSE)
  output$surfaceRaster <- renderUI({selectInput(inputId = "surface", label = "Choose a raster file for surface wood content:", list.files(paste0(rasterPath,"landscape/surfaceWood"),"\\.tif$"))})
  outputOptions(output, "surfaceRaster", suspendWhenHidden = FALSE)
  output$subsurfaceRaster <- renderUI({selectInput(inputId = "subsurface", label = "Choose a raster file for subsurface wood content:", list.files(paste0(rasterPath,"landscape/subsurfaceWood"),"\\.tif$"))})
  outputOptions(output, "subsurfaceRaster", suspendWhenHidden = FALSE)
  output$patternRaster <- renderUI({selectInput(inputId = "pattern", label = "Choose a raster file for pattern:", list.files(paste0(rasterPath,"landscape/pattern"),"\\.tif$"))})
  outputOptions(output, "patternRaster", suspendWhenHidden = FALSE)
  output$inundationPeriodRaster <- renderUI({selectInput(inputId = "inundationPeriod", label = "Choose a raster file for inundation period:", list.files(paste0(rasterPath,"landscape/inundationPeriod"),"\\.tif$"))})
  outputOptions(output, "inundationPeriodRaster", suspendWhenHidden = FALSE)
  output$usableGrowingSeasonLengthRaster <- renderUI({selectInput(inputId = "usableGrowingSeasonLength", label = "Choose a raster file for usable growing season length:", list.files(paste0(rasterPath,"landscape/usableGrowingSeasonLength"),"\\.tif$"))})
  outputOptions(output, "usableGrowingSeasonLengthRaster", suspendWhenHidden = FALSE)
  output$frequencyRaster <- renderUI({selectInput(inputId = "frequency", label = "Choose a raster file for frequency of flooding:", list.files(paste0(rasterPath,"landscape/frequency"),"\\.tif$"))})
  outputOptions(output, "frequencyRaster", suspendWhenHidden = FALSE)

  #Dropboxes for selecting soil raster files from the server:
  output$soilTypeRaster <- renderUI({selectInput(inputId = "soilType", label = "Choose a raster file for soil type:", list.files(paste0(rasterPath,"landscape/frequency"),"\\.tif$"))})
  outputOptions(output, "frequencyRaster", suspendWhenHidden = FALSE)

  observeEvent(eventExpr = input[["processFile"]],handlerExpr = { #runs the following code after the action button is pushed
    startTime <- Sys.time() #save the time we started at so we can check the difference after it's finished to see how long it took
    if(input$fileType=="Vector") fileName <- paste0(input$fileOutput,".csv") #add the .csv extension to the end of the file name if it's a vector
    if(input$fileType=="Raster") fileName <- paste0(input$fileOutput,".tif") #add the .tif extension to the end of the file name if it's a raster
    fileOUT <- paste0(resultsPath,fileName) #full path of the output file
    withProgress(message="Processing file:",value=0, { #track the progress of the following code
      if(input$fileType == "Vector"){ #if the selected file type is Vector then
        if(input$dataType == "Climate") climateResults("Vector", toString(input$cropType), paste0(vectorPath,input$vectorFile), fileOUT) #process the input file and save the results to the output file
        if(input$dataType == "Landscape") landscapeResults("Vector", toString(input$cropType), paste0(vectorPath,input$vectorFile), fileOUT)
      } else { #if the selected file type is Raster then
        if(input$dataType == "Climate"){ #if the climate data type is selected then
          climateResults("Raster", toString(input$cropType), paste0(rasterPath,"climate/",c(
            paste0("PPE/",input$PPE),paste0("springPPE/",input$springPPE),paste0("fallPPE/",input$fallPPE),paste0("EGDD/",input$EGDD),paste0("DBAFF/",input$DBAFF))), fileOUT, TRUE) #process the input file and save the results to the output file
        }
        if(input$dataType == "Landscape"){ #if the landscape data type is selected then
          landscapeResults("Raster", toString(input$cropType), paste0(rasterPath,"landscape/",c(
            paste0("region/",input$region),paste0("percentSlope/",input$percentSlope),paste0("landscapeType/",input$landscapeType),paste0("coarseFragments/",input$coarseFragments),paste0("surfaceWood/",input$surface),
            paste0("subsurfaceWood/",input$subsurface),paste0("pattern/",input$pattern),paste0("inundationPeriod/",input$inundationPeriod),paste0("usableGrowingSeasonLength/",input$usableGrowingSeasonLength),paste0("frequency/",input$frequency))),
                  fileOUT, TRUE) #process the input file and save the results to the output file
        }
        if(input$dataType == "Soil"){ #if the soil data type is selected then
          soilResults("Soil","Raster", input$cropType,
          c(input$claySurface,input$claySubsurface,input$sandSurface,input$sandSubsurface,input$siltSurface,input$siltSubsurface,input$cfsurface,input$cdSubsurface,input$awhcSurface,input$awhcSubsurface,input$ppe,
          input$ocSurfacePerc,input$surfacePH,input$subsurfacePH,input$surfaceEC,input$subsurfaceEC,input$sarSurface,input$sarSubsurface,input$E_DEPTH,input$bd),
                  fileOUT)
        }
      }
    })
    endTime <- Sys.time() #save the time we finished at
    timeTaken <- timeDifference(endTime,startTime) #calculate the time difference between when we started and when we finished to see how long it took
    showModal(modalDialog(title=paste("File successfully processed in:",timeTaken),paste("You may now click the download button to download your file."),easyClose=TRUE,footer=NULL)) #tell the user how long it took
    shinyjs::enable("Download") #enable the download button
    if(input$fileType=="Vector") output$Download <- downloadHandler(filename = fileName, content = function(file) { write.csv(read.csv(fileOUT), file, row.names = TRUE)}) #allows the file to be downloaded
    if(input$fileType=="Raster") output$Download <- downloadHandler(filename = fileName, content = function(file) { writeRaster(raster(fileOUT), file)})
    #output$table <- renderTable({head(read.csv(fileOUT))}) #display a table with a preview of the results file (the head, which is the first 6 rows)
  })
  shinyjs::disable("Download") #disable the download button until there's a file processed
}
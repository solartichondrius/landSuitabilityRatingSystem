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
  setwd(homePath)
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
  output$inundationRaster <- renderUI({selectInput(inputId = "inundation", label = "Choose a raster file for inundation period:", list.files(paste0(rasterPath,"landscape/inundationPeriod"),"\\.tif$"))})
  outputOptions(output, "inundationRaster", suspendWhenHidden = FALSE)
  output$ugslRaster <- renderUI({selectInput(inputId = "ugsl", label = "Choose a raster file for usable growing season length:", list.files(paste0(rasterPath,"landscape/usableGrowingSeasonLength"),"\\.tif$"))})
  outputOptions(output, "ugslRaster", suspendWhenHidden = FALSE)
  output$floodFreqRaster <- renderUI({selectInput(inputId = "floodFreq", label = "Choose a raster file for frequency of flooding:", list.files(paste0(rasterPath,"landscape/frequency"),"\\.tif$"))})
  outputOptions(output, "floodFreqRaster", suspendWhenHidden = FALSE)

  #Dropboxes for selecting soil raster files from the server:
  output$soilTypeRaster <- renderUI({selectInput(inputId = "soilType", label = "Choose a raster file for soil type:", list.files(paste0(rasterPath,"soil/soilType"),"\\.tif$"))})
  outputOptions(output, "soilTypeRaster", suspendWhenHidden = FALSE)
  output$claySurfaceRaster <- renderUI({selectInput(inputId = "claySurface", label = "Choose a raster file for surface clay:", list.files(paste0(rasterPath,"soil/claySurface"),"\\.tif$"))})
  outputOptions(output, "claySurfaceRaster", suspendWhenHidden = FALSE)
  output$claySubsurfaceRaster <- renderUI({selectInput(inputId = "claySubsurface", label = "Choose a raster file for subsurface clay:", list.files(paste0(rasterPath,"soil/claySubsurface"),"\\.tif$"))})
  outputOptions(output, "claySubsurfaceRaster", suspendWhenHidden = FALSE)
  output$siltSurfaceRaster <- renderUI({selectInput(inputId = "siltSurface", label = "Choose a raster file for surface silt:", list.files(paste0(rasterPath,"soil/siltSurface"),"\\.tif$"))})
  outputOptions(output, "siltSurfaceRaster", suspendWhenHidden = FALSE)
  output$siltSubsurfaceRaster <- renderUI({selectInput(inputId = "siltSubsurface", label = "Choose a raster file for subsurface silt:", list.files(paste0(rasterPath,"soil/siltSubsurface"),"\\.tif$"))})
  outputOptions(output, "siltSubsurfaceRaster", suspendWhenHidden = FALSE)
  output$cfSurfaceRaster <- renderUI({selectInput(inputId = "cfSurface", label = "Choose a raster file for surface coarse fragments:", list.files(paste0(rasterPath,"soil/cfSurface"),"\\.tif$"))})
  outputOptions(output, "cfSurfaceRaster", suspendWhenHidden = FALSE)
  output$cfSubsurfaceRaster <- renderUI({selectInput(inputId = "cfSubsurface", label = "Choose a raster file for subsurface coarse fragments:", list.files(paste0(rasterPath,"soil/cfSubsurface"),"\\.tif$"))})
  outputOptions(output, "cfSubsurfaceRaster", suspendWhenHidden = FALSE)
  output$ppeRaster <- renderUI({selectInput(inputId = "ppe", label = "Choose a raster file for ppe (precipitation minus potential evapotranspiration):", list.files(paste0(rasterPath,"soil/ppe"),"\\.tif$"))})
  outputOptions(output, "ppeRaster", suspendWhenHidden = FALSE)
  output$ocSurfacePercRaster <- renderUI({selectInput(inputId = "ocSurfacePerc", label = "Choose a raster file for oc surface percent:", list.files(paste0(rasterPath,"soil/ocSurfacePerc"),"\\.tif$"))})
  outputOptions(output, "ocSurfacePercRaster", suspendWhenHidden = FALSE)
  output$surfacePHRaster <- renderUI({selectInput(inputId = "surfacePH", label = "Choose a raster file for surface PH:", list.files(paste0(rasterPath,"soil/surfacePH"),"\\.tif$"))})
  outputOptions(output, "surfacePHRaster", suspendWhenHidden = FALSE)
  output$subsurfacePHRaster <- renderUI({selectInput(inputId = "subsurfacePH", label = "Choose a raster file for subsurface PH:", list.files(paste0(rasterPath,"soil/subsurfacePH"),"\\.tif$"))})
  outputOptions(output, "subsurfacePHRaster", suspendWhenHidden = FALSE)
  output$surfaceECRaster <- renderUI({selectInput(inputId = "surfaceEC", label = "Choose a raster file for surfaceEC:", list.files(paste0(rasterPath,"soil/surfaceEC"),"\\.tif$"))})
  outputOptions(output, "surfaceECRaster", suspendWhenHidden = FALSE)
  output$subsurfaceECRaster <- renderUI({selectInput(inputId = "subsurfaceEC", label = "Choose a raster file for subsurfaceEC:", list.files(paste0(rasterPath,"soil/subsurfaceEC"),"\\.tif$"))})
  outputOptions(output, "subsurfaceECRaster", suspendWhenHidden = FALSE)

  observeEvent(eventExpr = input[["processFile"]],handlerExpr = { #runs the following code after the action button is pushed
    startTime <- Sys.time() #save the time we started at so we can check the difference after it's finished to see how long it took
    if(input$fileType=="Vector") fileName <- paste0(input$fileOutput,".csv") #add the .csv extension to the end of the file name if it's a vector
    if(input$fileType=="Raster") fileName <- paste0(input$fileOutput,".tif") #add the .tif extension to the end of the file name if it's a raster
    fileOUT <- paste0(resultsPath,fileName) #full path of the output file
    withProgress(message="Processing file:",value=0, { #track the progress of the following code
      if(input$fileType == "Vector"){ #if the selected file type is Vector then
        if(input$dataType == "Climate") climateResults("Vector", toString(input$cropType), paste0(vectorPath,input$vectorFile), fileOUT) #process the input file and save the results to the output file
        if(input$dataType == "Landscape") landscapeResults("Vector", toString(input$cropType), paste0(vectorPath,input$vectorFile), fileOUT)
        if(input$dataType == "Soil") soilResults("Vector", toString(input$cropType), paste0(vectorPath,input$vectorFile), fileOUT)
      } else { #if the selected file type is Raster then
        if(input$dataType == "Climate"){ #if the climate data type is selected then
          climateResults("Raster", toString(input$cropType), paste0(rasterPath,"climate/",c(
            paste0("PPE/",input$PPE),paste0("springPPE/",input$springPPE),paste0("fallPPE/",input$fallPPE),paste0("EGDD/",input$EGDD),paste0("DBAFF/",input$DBAFF))), fileOUT, TRUE) #process the input file and save the results to the output file
        }
        if(input$dataType == "Landscape"){ #if the landscape data type is selected then
          landscapeResults("Raster", toString(input$cropType), paste0(rasterPath,"landscape/",c(
            paste0("region/",input$region),paste0("percentSlope/",input$percentSlope),paste0("landscapeType/",input$landscapeType),paste0("coarseFragments/",input$coarseFragments),paste0("surfaceWood/",input$surface),
            paste0("subsurfaceWood/",input$subsurface),paste0("pattern/",input$pattern),paste0("inundationPeriod/",input$inundation),paste0("usableGrowingSeasonLength/",input$ugsl),paste0("frequency/",input$floodFreq))),
                  fileOUT, TRUE) #process the input file and save the results to the output file
        }
        if(input$dataType == "Soil"){ #if the soil data type is selected then
          soilResults("Raster", toString(input$cropType), paste0(rasterPath,"soil/",c(
          paste0("soilType/",input$soilType),paste0("claySurface/",input$claySurface),paste0("claySubsurface/",input$claySubsurface),
          paste0("siltSurface/",input$siltSurface),paste0("siltSubsurface/",input$siltSubsurface),
          paste0("cfSurface/",input$cfSurface),paste0("cfSubsurface/",input$cfSubsurface),
          paste0("ppe/",input$ppe), paste0("ocSurfacePerc/",input$ocSurfacePerc),paste0("surfacePH/",input$surfacePH),paste0("subsurfacePH/",input$subsurfacePH),
          paste0("surfaceEC/",input$surfaceEC),paste0("subsurfaceEC/",input$subsurfaceEC))), fileOUT, TRUE)
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
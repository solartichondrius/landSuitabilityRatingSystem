# Title     : Server
# Objective : Code for the server for the website
# Created by: test
# Created on: 2020-02-19

library(shiny)
library(shinyjs)

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
  source("All.R") #load all the required files

  output$vectorFiles <- renderUI({selectInput(inputId = "vectorFile",  label = "Choose a vector file:", list.files(vectorPath,"\\.csv$"))})
  outputOptions(output, "vectorFiles", suspendWhenHidden = FALSE)

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

  observeEvent(eventExpr = input[["processFile"]],handlerExpr = { #runs the following code after the action button is pushed
    fileName <- paste0(input$fileOutput,".csv") #add the .csv extension to the end of the file name
    fileOUT <- paste0(resultsPath,fileName) #full path of the output file
    if(is.null(fileOUT)  #if the output file is null
      | (input$fileType == "Vector" & is.null(input$vectorFile)) #or if the selected file type is Vector but the vector file is null
      | (input$fileType == "Raster" & ( #or if the selected file type is Raster and
      (input$dataType == "Climate" & (is.null(input$PPE)|is.null(input$springPPE)|is.null(input$fallPPE)|is.null(input$EGGD)|is.null(input$DBAFF)) #if the Climate data type is selected but all its required files are null
      | (input$dataType == "Landscape" & (is.null(input$region)|is.null(input$percentSlope)|is.null(input$landscapeType)|is.null(input$coarseFragments)|is.null(input$surface)|is.null(input$subsurface)
        |is.null(input$pattern)|is.null(input$inundationPeriod)|is.null(input$usableGrowingSeasonLength)|is.null(input$frequency))) #if the Landscape data type is selected but all its required files are null
      | (input$dataType == "Soil" & (is.null(input$claySurface)|is.null(input$claySubsurface)|is.null(input$sandSurface)|is.null(input$sandSubsurface)|is.null(input$siltSurface)|is.null(input$siltSubsurface)
        |is.null(input$cfSurface)|is.null(input$cfSubsurface)|is.null(input$awhcSurface)|is.null(input$awhcSubsurface)|is.null(input$ppe)|is.null(input$ocSurfacePerc)|is.null(input$surfacePH)
        |is.null(input$subsurfacePH)|is.null(input$surfaceEC)|is.null(input$subsurfaceEC)|is.null(input$sarSurface)|is.null(input$sarSubsurface)|is.null(input$E_DEPTH)|is.null(input$bd)))
      )))){
      showModal(modalDialog(title="ERROR: Missing fields.","Make sure you have filled in all the required fields.",easyClose=TRUE,footer=NULL)) #display popup message notifying that there are missing fields
      return(NULL) #then return without doing anything else
    }
    withProgress(message="Processing file:",value=0, { #track the progress of the following code
      if(input$fileType == "Vector"){ #if the selected file type is Vector then
        results(input$dataType, "Vector", input$cropType, paste0(vectorPath,input$vectorFile), fileOUT) #process the input file and save the results to the output file
      } else { #if the selected file type is Raster then
        if(dataType == "Climate"){ #if the climate data type is selected then
          results("Climate", "Raster", input$cropType, c(input$PPE,input$springPPE,input$fallPPE,input$EGDD,input$DBAFF), fileOUT) #process the input file and save the results to the output file
        }
        if(dataType == "Landscape"){ #if the landscape data type is selected then
          results("Landscape", "Raster", input$cropType,
                  c(input$region,input$percentSlope,input$landscapeType,input$coarseFragments,input$surface,input$subsurface,input$pattern,input$inundationPeriod,input$usableGrowingSeasonLength,input$frequency),
                  fileOUT) #process the input file and save the results to the output file
        }
        if(dataType == "Soil"){ #if the soil data type is selected then
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
  })
  shinyjs::disable("Download") #disable the download button until there's a file processed
}
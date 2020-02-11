# Title     : Website
# Objective : Make a webpage for the Land Suitability Rating System
# Created by: CurtisTh
# Created on: 2020-02-10

library(shiny)
ui <- fluidPage( #code for the webpage's UI (user interface)
  titlePanel("Land Suitability Rating System"), #title at the top of the page
  fileInput(inputId = "fileInput", label = "Choose a file (or files) to process:", multiple = TRUE), #lets user select one or more files
  radioButtons(inputId = "dataType", label = "Type of Data:", choices = c("Climate" = "Climate","Landscape" = "Landscape", "Soil" = "Soil")), #user can select one radio button
  selectInput(inputId = "cropType", label = "Crop type:", choices = "Spring Seeded Small Grains"), #user can select one item from a list in a drop-down box
  radioButtons(inputId = "fileType", label = "File Type:", choices = c("Vector" = "Vector","Raster" = "Raster")), #user can select one radio button
  textInput(inputId = "fileOutput", label = "Choose where to save the results:"), #user can type in the full path for where they want to save the results
  actionButton(inputId = "processFile", label = "Process File") #click this button to run the code to process the file and save the results
)
server <- function(input,output){ #code which runs on the server
  options(shiny.maxRequestSize=2^32) #Allows files up to 4GB (default limit was only 5MB)
  if(getwd() != "C:/Users/CurtisTh/PycharmProjects/landSuitabilityRatingSystem/landSuitabilityRatingSystem"){
    setwd("C:/Users/CurtisTh/PycharmProjects/landSuitabilityRatingSystem/landSuitabilityRatingSystem")
  } #make sure we're in the correct working directory (obviously these 2 lines will need to be changed if run on a different computer)
  source("All.R") #load all the required files
  observeEvent(eventExpr = input[["processFile"]],handlerExpr = {
    fileIN <- input$fileInput #get the input file
    fileOUT <- input$fileOutput #get the output file
    if(is.null(fileIN) | is.null(fileOUT)) return(NULL) #if the input or output file are null then do nothing
    results(input$dataType, input$fileType, fileIN$datapath, fileOUT) #process the input file and save the results to the output file
  })
}
shinyApp(ui=ui,server=server) #start the webpage with the ui and server code written in this file
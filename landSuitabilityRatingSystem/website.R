# Title     : Website
# Objective : Make a webpage for the Land Suitability Rating System
# Created by: CurtisTh
# Created on: 2020-02-10

library(shiny)
ui <- fluidPage(
  titlePanel("Land Suitability Rating System"),
  fileInput(inputId = "fileInput", label = "Choose a file to process:", multiple = TRUE),
  radioButtons(inputId = "dataType", label = "Type of Data:", choices = c("Climate" = "Climate","Landscape" = "Landscape", "Soil" = "Soil")),
  selectInput(inputId = "cropType", label = "Crop type:", choices = "Spring Seeded Small Grains"),
  radioButtons(inputId = "fileType", label = "File Type:", choices = c("Vector" = "Vector","Raster" = "Raster")),
  textInput(inputId = "fileOutput", label = "Choose where to save the results:"),
  actionButton(inputId = "processFile", label = "Process File")
)
server <- function(input,output){
  options(shiny.maxRequestSize=2^32)
  if(getwd() != "C:/Users/CurtisTh/PycharmProjects/landSuitabilityRatingSystem/landSuitabilityRatingSystem"){
    setwd("C:/Users/CurtisTh/PycharmProjects/landSuitabilityRatingSystem/landSuitabilityRatingSystem")
  }
  source("All.R")
  observeEvent(eventExpr = input[["processFile"]],handlerExpr = {
    fileIN <- input$fileInput
    fileOUT <- input$fileOutput
    if(is.null(fileIN) | is.null(fileOUT)) return(NULL)
    results(input$dataType, input$fileType, fileIN$datapath, fileOUT)
  })
}
shinyApp(ui=ui,server=server)
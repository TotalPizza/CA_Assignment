
library(shiny)
library(leaflet)
library(tidyverse)
library(maps)
library(sp)

server <- function(input,output, session){
  
  data <- reactive({
    x <- BLData
  })  
  
  labels <- sprintf(
    "<strong>%s</strong><br/>Total Cases: %g <br/>Total Deaths: %g",
    BLData$Bundesland, BLData$AnzahlFall, BLData$AnzahlTodesfall) %>% 
    lapply(htmltools::HTML)
  
  output$mymap <- renderLeaflet({
    BLData <- data()
    
    m <- leaflet(BLData) %>%
    addPolygons(fillColor = topo.colors(10, alpha = NULL), 
                stroke = FALSE,
                label = labels,
                labelOptions = labelOptions(
                  style = list("font-weight" = "normal", padding = "3px 8px"),
                  textsize = "15px",
                  direction = "auto"))
  })
}

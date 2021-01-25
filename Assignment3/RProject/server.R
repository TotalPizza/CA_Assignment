
library(shiny)
library(leaflet)
library(tidyverse)
library(maps)
library(sp)

server <- function(input,output, session){
  
  
  output$map <- renderLeaflet({
    
    DEU1 <- raster::getData("GADM", country="DEU", level=1)
    
    m <-  leaflet(data = DEU1, options = leafletOptions(minZoom = 6.4, maxZoom = 9, width = NULL, height = 300)) %>%
      addPolygons(fillColor = topo.colors(10, alpha = NULL), stroke = FALSE)
  }) 
}

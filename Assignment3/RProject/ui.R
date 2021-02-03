
library(shiny)
library(shinydashboard)
library(leaflet)
library(tidyverse)

dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
dashboardBody(
  fluidRow(
    box(
      tags$style(type = "text/css", "#map {height: calc(100vh - 80px) !important;}"),
      leafletOutput("mymap",height = 1000),
    ),
    
    box(
      title = "Controls",
      sliderInput("Datum",
                  "Datum:",
                  min = as.Date("2020-01-02","%Y-%m-%d"),
                  max = as.Date("2021-01-15","%Y-%m-%d"),
                  value=as.Date("2020-01-15"),
                  timeFormat="%Y-%m-%d")
      
    )
  )
  
  )
)

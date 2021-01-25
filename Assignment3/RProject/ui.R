
library(shiny)
library(shinydashboard)
library(leaflet)
library(tidyverse)

dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
dashboardBody(
  tags$style(type = "text/css", "#map {height: calc(100vh - 80px) !important;}"),
  leafletOutput("map",height = 1000)
  )
)

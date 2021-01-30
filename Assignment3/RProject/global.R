
library(shiny)
library(leaflet)
library(dplyr)

BLData <- geojsonio::geojson_read("BLData.json", what = "sp")

CovidData <- read.csv("./RKI_COVID19.csv", header = TRUE)

NachFallBundesland <- select(CovidData, Bundesland, AnzahlFall, AnzahlTodesfall)
NachFallBundesland <- aggregate(. ~Bundesland, data=NachFallBundesland, sum, na.rm=TRUE)

BLData@data = data.frame(BLData@data, NachFallBundesland[match(BLData@data[,"name"], NachFallBundesland[,"Bundesland"]),])

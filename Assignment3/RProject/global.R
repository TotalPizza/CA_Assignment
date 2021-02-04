
library(shiny)
library(leaflet)
library(dplyr)

BLData <- geojsonio::geojson_read("BLData.json", what = "sp")

CovidData <- read.csv("./RKI_COVID19.csv", header = TRUE)

CovidData<-CovidData[!(CovidData$AnzahlFall< 0),]


#Faktoren Selectieren
NachFallBundesland <- select(CovidData, Bundesland, AnzahlFall, AnzahlTodesfall)
#Daten Reinigen
#NachFallBundesland$Altersgruppe <- stringr::str_replace_all(NachBundesland$Altersgruppe, "[A]", "")
#NachFallBundesland$Altersgruppe <- stringr::str_replace_all(NachBundesland$Altersgruppe, "[-]", "")
#NachFallBundesland<-NachBundesland[!(NachBundesland$Altersgruppe=="unbekannt"),]
#NachFallBundesland<-NachBundesland[!(NachBundesland$Geschlecht=="unbekannt"),]

NachFallBundesland <- aggregate(. ~Bundesland, data=NachFallBundesland, sum, na.rm=TRUE)

BLData@data = data.frame(BLData@data, NachFallBundesland[match(BLData@data[,"name"], NachFallBundesland[,"Bundesland"]),])

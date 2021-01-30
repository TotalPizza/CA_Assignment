library(ggplot2)
library(ggdendro)
library(dplyr)
library(tibble)
library(tidyverse)
library(sp)
library(geojsonR)
theme_set(theme_bw())
theme_set(theme_classic())


CovidData <- read.csv("./RKI_COVID19.csv", header = TRUE)

#NachBundesland <- select(CovidData, Bundesland, AnzahlFall, Meldedatum, Altersgruppe, Geschlecht)

#NachBundesland$Altersgruppe <- stringr::str_replace_all(NachBundesland$Altersgruppe, "[A]", "")
#NachBundesland$Altersgruppe <- stringr::str_replace_all(NachBundesland$Altersgruppe, "[-]", "")
#NachBundesland<-NachBundesland[!(NachBundesland$Altersgruppe=="unbekannt"),]
#NachBundesland<-NachBundesland[!(NachBundesland$Geschlecht=="unbekannt"),]
#NachBundesland<- aggregate(list(AnzahlFall = NachBundesland$AnzahlFall), by = list(NachBundesland$Bundesland, NachBundesland$Meldedatum, NachBundesland$Altersgruppe, NachBundesland$Geschlecht), sum)

#####################################################

NachFallBundesland <- select(CovidData, Bundesland, AnzahlFall, AnzahlTodesfall)
NachFallBundesland <- aggregate(NachFallBundesland$AnzahlFall, list(Bundesland = NachFallBundesland$Bundesland, AnzahlTodesfall = NachFallBundesland$AnzahlTodesfall), sum)

BLData@data = data.frame(BLData@data, NachFallBundesland[match(BLData@data[,"name"], NachFallBundesland[,"Bundesland"]),])

#saveRDS(NachFallBundesland, "./BLData.rds")



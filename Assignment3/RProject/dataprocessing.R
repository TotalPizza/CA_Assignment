library(ggplot2)
library(ggdendro)
library(dplyr)
library(tibble)
library(tidyverse)
theme_set(theme_bw())
theme_set(theme_classic())


CovidData <- read.csv("./RKI_COVID19.csv", header = TRUE)

NachBundesland <- select(CovidData, Bundesland, AnzahlFall, Meldedatum, Altersgruppe, Geschlecht)

NachBundesland$Altersgruppe <- stringr::str_replace_all(NachBundesland$Altersgruppe, "[A]", "")
NachBundesland$Altersgruppe <- stringr::str_replace_all(NachBundesland$Altersgruppe, "[-]", "")
NachBundesland<-NachBundesland[!(NachBundesland$Altersgruppe=="unbekannt"),]
NachBundesland<-NachBundesland[!(NachBundesland$Geschlecht=="unbekannt"),]

NachBundesland<- aggregate(list(AnzahlFall = NachBundesland$AnzahlFall), by = list(NachBundesland$Bundesland, NachBundesland$Meldedatum, NachBundesland$Altersgruppe, NachBundesland$Geschlecht), sum)

saveRDS(NachBundesland, "./data.rds")

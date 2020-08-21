##################################################################
######Variables globales de l'application (lu une seule fois)######
##################################################################
#####chargement des libraries#####

library(plotly)
library(reshape)
library(dplyr)
library(tidyverse)
library(tidyr)
library(shiny)
library(markdown)
library(shinyjs)
library(shinyauthr)
library(leaflet)
library(leaflet.minicharts)
library(geojsonio)
library(units)
library(maptools)
library(leafsync)
library(sodium)
library(rdrop2)
library(data.table)
library(lubridate)
library(magrittr)
library(RColorBrewer)


####Explication des variables#########

#subset_n <- TRUE or FALSE si multiple ou simple
#subset_n_names <- contient le nom des colonnes de subset
#subset_n_value <- contient les valeurs sélectionnées
#dat_cut_subset_n <- Data frame après tri en fonction du subset
#dat_cut_subset_n-1 <- Data frame avant le tri en fonction du subset
#x_axis_names <- contient le nom de la colonne utilisé en X pour le plot
#subset_n_valid <- check si le subset exist ou pas (TRUE ou FALSE)
#date_min <- contient l'année minimal
#date_max <- contient l'année maximal
#date_valid <- TRUE = YYYY/MM/DD  FALSE = DD/MM/YYYY

#pie_n_valid <- TRUE or FALSE si le pie exist ou pas
#pie_n_names <- Contient le nom des colonnes de pie_n
#map_pie_n_value <- contient les valeurs sélectionnées

#######################################

########lien vers les scripts de telechargement des donnees et d'autorisation d'acces
source("access/access_box.R")

couche_1 <- geojsonio::geojson_read("access/YC_tiques_individu/couche_1_parcellaire_2020.geojson", what = "sp")
couche_2 <- geojsonio::geojson_read("access/YC_tiques_individu/couche_2_enclos.geojson", what = "sp")
couche_3 <- geojsonio::geojson_read("access/YC_tiques_individu/couche_3_base_de_vie.geojson", what = "sp")
couche_4 <- geojsonio::geojson_read("access/YC_tiques_individu/couche_4_cabanes.geojson", what = "sp")
wgs84 <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
couche_1 <- spTransform(couche_1,wgs84)
couche_2 <- spTransform(couche_2,wgs84)
couche_3 <- spTransform(couche_3,wgs84)
couche_4 <- spTransform(couche_4,wgs84)


######Test cent_dist_geo
# cent_dist_geo<-geojsonio::geojson_read("access/centroides_tirage.geojson", what = "sp",  stringsAsFactors = TRUE)
# wgs84 <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
# cent_dist_geo <- spTransform(cent_dist_geo,wgs84)
# cent_dist_geo <- as.data.frame(cent_dist_geo)
# names(cent_dist_geo) <- gsub("\\.","\\~",names(cent_dist_geo))
# dat <- dat[,-c(4,5)]

#dat<- read.csv("C:/Users/Utilisateur/Desktop/OpenObs/DonneesBrutes/YC_tiques_individu/data_tiques_final.csv", header = TRUE, encoding = "UTF-08")

col_pie<-grep("pie", names(dat))
dat[,col_pie]<-apply(dat[,col_pie],2,as.character)
dat[,col_pie][is.na(dat[,col_pie])]<- "non recherché"
dat[,col_pie]<-apply(dat[,col_pie],2,as.factor)

names(dat) <- tolower(names(dat))

#####Récupération préfixes et suffixes######
prefixe <- lapply(str_split(names(dat),'~'),"[[",1)
prefixes<-unlist(prefixe[grep("(^subset_date)|(subset_1)|(subset_2)|(subset_3)|(subset_4)|(geo_1)|(geo_2)|(link)|(pie_1)|(pie_2)|(pie_3)|(pie_4)|(quantity)", prefixe, fixed = FALSE)])
suffixes<-unlist(lapply(str_split(names(dat)[grep("(subset_date)|(subset_1)|(subset_2)|(subset_3)|(subset_4)|(geo_1)|(geo_2)|(link)|(pie_1)|(pie_2)|(pie_3)|(pie_4)|(quantity)", prefixe, fixed = FALSE)],'~'),"[[",2))
############################################

###########################################
#####Récupération axe x##########

x_axis_names <- str_replace(paste0(prefixes[grep("_x",prefixes)],suffixes[grep("_x",prefixes)]),"_x","~")
colnames(dat)[grep(prefixe[grep(prefixes[grep("_x",prefixes)],prefixe)],colnames(dat))] <- x_axis_names
geo_2_names <- names(dat)[grep("^geo_2~", tolower(names(dat)))]
#################################

#####Récupération wikisp et link#########
if (length(names(dat)[grep("_wikisp",names(dat))]) != 0){
  wikisp_names <- names(dat)[grep("wiki_sp",names(dat))]
} else {
  wikisp_names <- x_axis_names
}

link_names <- names(dat)[grep("^link",names(dat))]
#########################################

#####Correction nom colonne date#####
colnames(dat)[grep("subset_date",names(dat))] <- "subset_date~date"
if (length(which(is.na(dat$'subset_date~date')))>0){
  dat <- dat[-which(is.na(dat$'subset_date~date')),]
}

#########################
########si des quantites manquent on les remplace par 1 car lespece est presente
if ("quantity~quantite"%in% colnames(dat)){
  dat$'quantity~quantite' <- replace(dat$'quantity~quantite',is.na(dat$'quantity~quantite'),1)
} else {
  dat[,'quantity~quantite'] <- 1
}


#####Changement format date et récupération date min et max ######
if (str_detect(unique(substring(dat$'subset_date~date',1,4))[1],"/")){
  dat[,"subset_date~date"] <- dmy(dat[,"subset_date~date"])
}
date_min <- min(substring(dat$'subset_date~date',1,4))
date_max <- max(substring(dat$'subset_date~date',1,4))

############################

#####Check si le subset existe ou non######
for (i in (1:4)){
  if (length(grep(paste0("subset_",i),names(dat))) > 0 ){
    name <- paste0(paste0("subset_",i),"_valid")
    assign(name,TRUE)
  } else {
    name <- paste0(paste0("subset_",i),"_valid") 
    assign(name,FALSE)
  }
}
##########################################
#####Check si le pie existe ou non######
for (i in (1:4)){
  if (length(grep(paste0("pie_",i),names(dat))) > 0 ){
    name <- paste0(paste0("pie_",i),"_valid")
    assign(name,TRUE)
  } else {
    name <- paste0(paste0("pie_",i),"_valid") 
    assign(name,FALSE)
  }
}
##########################################


########### Passe tous les subset en facteur pour lire les valeurs numériques######
for (i in names(dat)){
  if (str_detect(i,"subset_")){
    dat[,i] <- factor(dat[,i])
    levels(dat[,i]) <- tolower(levels(dat[,i]))
  }
}
#######################################"

######Création des différentes variables en fonction des subsets utilisés###########################
if (subset_1_valid){
  source("scripts/subset_1_createVar.r")
}

if (subset_2_valid){
  source("scripts/subset_2_createVar.r")
}

if (subset_3_valid){
  source("scripts/subset_3_createVar.r")
}

if (subset_4_valid){
  source("scripts/subset_4_createVar.r")
}

###################################################

######Création des différentes variables en fonction des pies utilisés###########################
if (pie_1_valid){
  if (length(grep("^pie_1",names(dat))) > 1){
    pie_1_names <- names(dat[,grep("^pie_1",tolower(names(dat)))])
  } else {
    pie_1_names <- names(dat)[grep("^pie_1", tolower(names(dat)))]
  }
}

if (pie_2_valid){
  if (length(grep("^pie_2",names(dat))) > 1){
    pie_2_names <- names(dat[,grep("^pie_2",tolower(names(dat)))])
  } else {
    pie_2_names <- names(dat)[grep("^pie_2", tolower(names(dat)))]
  }
}

if (pie_3_valid){
  if (length(grep("^pie_3",names(dat))) > 1){
    pie_3_names <- names(dat[,grep("^pie_3",tolower(names(dat)))])
  } else {
    pie_3_names <- names(dat)[grep("^pie_3", tolower(names(dat)))]
  }
}

if (pie_4_valid){
  if (length(grep("^pie_4",names(dat))) > 1){
    pie_4_names <- names(dat[,grep("^pie_4",tolower(names(dat)))])
  } else {
    pie_4_names <- names(dat)[grep("^pie_4", tolower(names(dat)))]
  }
}

###################################################

######Checking geo_1#####
if(length(grep("^geo_1",names(dat))) != 0){
  geo_1_valid <- TRUE
  if (length(grep("^geo_1",names(dat))) > 1){
    geo_1_names <- names(dat[,grep("^geo_1",tolower(names(dat)))])
  } else {
    geo_1_names <- names(dat)[grep("^geo_1~", tolower(names(dat)))]
  }
} else {
  geo_1_valid <- FALSE
  geo_1_names <- "2"
}

########################

##############Checking geo_2#########
if (length(grep("^geo_2_lat", names(dat))) != 0){
  dat[,grep("^geo_2_lat", names(dat))]<-as.numeric(gsub(",", ".",dat[,grep("^geo_2_lat", names(dat))]))
  dat[,grep("^geo_2_long", names(dat))]<-as.numeric(gsub(",", ".",dat[,grep("^geo_2_long", names(dat))]))
  cent_valid <- TRUE
} else {
  if (exists('cent_dist_geo')){
    if (length(names(cent_dist_geo)[grep("geo_2_x",names(cent_dist_geo))]) != 0){
      geo_2_json <- names(cent_dist_geo)[grep("geo_2_x",names(cent_dist_geo))]
    } else {
      geo_2_json <- geo_2_names
    }
    dat$`geo_2_long~longitude` <- NA
    dat$`geo_2_lat~latitude` <- NA
    for(i in levels(dat[,geo_1_names])){
      for (j in levels(dat[,geo_2_names])){
        for (k in 1:nrow(cent_dist_geo)) {
          if(i == as.character(cent_dist_geo[k,grep("^geo_1",names(cent_dist_geo))])) {
            if (j == as.character(cent_dist_geo[k,geo_2_json])) {
              dat[which(dat[,geo_2_names]==j & dat[,geo_1_names] == i),"geo_2_long~longitude"] <- cent_dist_geo[k,grep("^geo_2_long",names(cent_dist_geo))]
              dat[which(dat[,geo_2_names]==j & dat[,geo_1_names] == i),"geo_2_lat~latitude"] <- cent_dist_geo[k,grep("^geo_2_lat",names(cent_dist_geo))]
            }
          }
        }
      }
    }
    cent_valid <- TRUE
  } else {
    cent_valid <- FALSE
  }
}
#####################################
#####Checking couche######


####Duplication du dat pour création dataTable#####
dat_DT <- dat

######Création de l'axe x marge des graphiques#####
m <- list(
  l = 50,
  r = 50,
  b = 200,
  t = 10,
  pad = 4
)

xaxis <- list(
  title = 'species',
  cex.axis =0.5,
  cex.lab = 0.5
)
########################################################

########################################################
#####sauvegarde du jeu de données complet
datt<-dat
#####réduction du jeu de données à 1 ligne de façon à générer l'UI dynamique rapidement quelque soit la taille du jeu de données
dat<-dat[1,]
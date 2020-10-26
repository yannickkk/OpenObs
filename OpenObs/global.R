################################################
######Variables globales de l'application ######
################################################
#####chargement des libraries#####

# library(plotly)
# library(reshape)
# library(dplyr)
# library(tidyverse)
# library(tidyr)
# library(shiny)
# library(markdown)
# library(leaflet)
# library(leaflet.minicharts)
# library(units)
# library(maptools)
# library(leafsync)
# library(sodium)
# library(rdrop2)
# library(data.table)
# library(lubridate)
# library(magrittr)
# library(sf)
mypackages<-c("shiny", "shinyjs","plotly","reshape","dplyr","tidyverse","tidyr","markdown","leaflet","leaflet.minicharts","units","maptools","leafsync","sodium","rdrop2","lubridate", "magrittr", "sf","RPostgreSQL","data.table")
for (p in mypackages){
  if(!require(p, character.only = TRUE)){
    install.packages(p)
    library(p, character.only = TRUE)
  }
}

source("scripts/settings.R")

 if (nchar(nom_dossier) != 0){
   dir_path<<- gsub("//","/",paste0("donnees/",nom_dossier,"/"))} else {dir_path<- paste0(getwd(),"/")}

#setwd(dirname(rstudioapi::getSourceEditorContext()$path))

if (length(grep("^data_",list.files(dir_path))) !=0){
  dat <- as.data.frame(fread(paste0(dir_path,"data_",nom_dossier,".csv"), stringsAsFactors = TRUE, encoding = "UTF-8"))} else {dat <- as.data.frame(fread(grep("^data",list.files(), value = TRUE), stringsAsFactors = TRUE, encoding = "UTF-8"))}
if (length(which(is.na(dat[,grep("geo_2_long",names(dat))])) != 0))  {dat<-dat[-which(is.na(dat[,grep("geo_2_long",names(dat))])),]}
if (length(which(is.na(dat[,grep("geo_2_lat",names(dat))])) != 0))  {dat<-dat[-which(is.na(dat[,grep("geo_2_lat",names(dat))])),]}
  
#####oGR WGS 84
wgs84 <- "+proj=longlat +datum=WGS84"
######Test cent_dist_geo########
if (length(grep("^geo_2",list.files(dir_path))) !=0)
  {
  cent_dist_geo <- read_sf(paste0(dir_path,grep("^geo_2",list.files(dir_path), value= TRUE)), as_tibble =FALSE)
  cent_dist_geo <- sf::st_transform(cent_dist_geo,wgs84)
  cent_dist_geo <- as.data.frame(cent_dist_geo)
  names(cent_dist_geo) <- gsub("\\.","\\~",names(cent_dist_geo))
}

######chargement des couches polygones utilisateur et reprojection

if (length(grep("^couche_1",list.files(dir_path))) !=0)
    {
    couche_1 <- read_sf(paste0(dir_path,grep("^couche_1",list.files(dir_path), value= TRUE)), as_tibble =FALSE)
    couche_1 <- st_transform(couche_1,wgs84)

}
if (length(grep("^couche_2",list.files(dir_path))) !=0)
    {
    couche_2 <- read_sf(paste0(dir_path,grep("^couche_2",list.files(dir_path), value= TRUE)), as_tibble =FALSE)
    couche_2 <- sf::st_transform(couche_2,wgs84)
}
if (length(grep("^couche_3",list.files(dir_path))) !=0)
  {
    couche_3 <- read_sf(paste0(dir_path,grep("^couche_3",list.files(dir_path), value= TRUE)), as_tibble =FALSE)
    couche_3 <- sf::st_transform(couche_3,wgs84)
}
if (length(grep("^couche_4",list.files(dir_path))) !=0)
    {
    couche_4 <- read_sf(paste0(dir_path,grep("^couche_4",list.files(dir_path), value= TRUE)), as_tibble =FALSE)
    couche_4 <- sf::st_transform(couche_4,wgs84)
}
# if (length(grep("^couche_5",list.files(dir_path))) !=0)
# {
#   couche_5 <- raster(paste0(dir_path,grep("^couche_5",list.files(dir_path), value= TRUE)))
# }

########chargement du protocole
if (length(grep(".html$",list.files(dir_path))) !=0)
  {
   htmlf <- paste0(dir_path,grep(".html$",list.files(dir_path), value = TRUE))
 }

 # col_pie<-grep("pie", names(dat))
 # dat[,col_pie]<-apply(dat[,col_pie],2,as.character)
 # dat[,col_pie][is.na(dat[,col_pie])]<- ""
 # dat[,col_pie]<-apply(dat[,col_pie],2,as.factor)

names(dat) <- tolower(names(dat))

#####Récupération préfixes et suffixes######
prefixe <- lapply(str_split(names(dat),'~'),"[[",1)
prefixes<-unlist(prefixe[grep("(^subset_date)|(subset_1)|(subset_2)|(subset_3)|(subset_4)|(geo_1)|(geo_2)|(link)|(pie_1)|(pie_2)|(pie_3)|(pie_4)|(wikisp)|(x)|(quantity)", prefixe, fixed = FALSE)])
suffixes<-unlist(lapply(str_split(names(dat)[grep("(subset_date)|(subset_1)|(subset_2)|(subset_3)|(subset_4)|(geo_1)|(geo_2)|(link)|(pie_1)|(pie_2)|(pie_3)|(pie_4)|(wikisp)|(x)|(quantity)", prefixe, fixed = FALSE)],'~'),"[[",2))
############################################

###########################################
#####Récupération axe x##########

x_axis_names <- str_replace(paste0(prefixes[grep("_x",prefixes)],suffixes[grep("_x",prefixes)]),"_x","~")
colnames(dat)[grep(prefixe[grep(prefixes[grep("_x",prefixes)],prefixe)],colnames(dat))] <- x_axis_names
geo_2_names <- names(dat)[grep("^geo_2~", tolower(names(dat)))]
#################################

#####Récupération wikisp et link#########
if(length(prefixes[grep("_wikisp",prefixes)]) != 0){
  wikisp_names <- str_replace(paste0(prefixes[grep("_wikisp",prefixes)],suffixes[grep("_wikisp",prefixes)]),"_wikisp","~")
  colnames(dat)[grep(prefixe[grep(prefixes[grep("_wikisp",prefixes)],prefixe)],colnames(dat))] <- wikisp_names
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
  source("scripts/subset_1_createVar.R")
}

if (subset_2_valid){
  source("scripts/subset_2_createVar.R")
}

if (subset_3_valid){
  source("scripts/subset_3_createVar.R")
}

if (subset_4_valid){
  source("scripts/subset_4_createVar.R")
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
    if (geo_1_valid){
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
    } else {
      for (j in levels(dat[,geo_2_names])){
        for (k in 1:nrow(cent_dist_geo)) {
          if (j == as.character(cent_dist_geo[k,geo_2_json])) {
            dat[which(dat[,geo_2_names]==j),"geo_2_long~longitude"] <- cent_dist_geo[k,grep("^geo_2_long",names(cent_dist_geo))]
            dat[which(dat[,geo_2_names]==j),"geo_2_lat~latitude"] <- cent_dist_geo[k,grep("^geo_2_lat",names(cent_dist_geo))]
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
  title = axe_abscisse,
  cex.axis =0.5,
  cex.lab = 0.5
)
########################################################
########################################################
#####sauvegarde du jeu de données complet
datt<-dat
#####réduction du jeu de données à 1 ligne de façon à générer l'UI dynamique rapidement quelque soit la taille du jeu de données
dat<-dat[1,] ####le jeu de données complet est réinjecté à la fin du script update_UI_map_geo.R à partir de datt
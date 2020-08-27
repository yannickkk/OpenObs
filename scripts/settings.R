##########variables de la page##############
if(file.exists("donnees/settings.csv")){
  settings <- read.csv("donnees/settings.csv")
  if (length(settings[,1]) == 54){
    settings <- settings[-1,]
  }
  
  titre_fenetre <- as.character(settings[1,1])
  
  logo <- as.character(settings[2,1])
  
  logo_lien <- as.character(settings[3,1])
  
  
  #############################################
  ######### Titre des onglets #################
  
  titre_onglet1 <- as.character(settings[4,1])
  titre_onglet2 <- as.character(settings[5,1])
  titre_onglet3 <- as.character(settings[6,1])
  titre_onglet4 <- as.character(settings[7,1])
  #############################################
  
  ######### Label subset ##############
  label1_select_2 <- as.character(settings[8,1])
  label2_select_2 <- as.character(settings[9,1])
  label3_select_2 <- as.character(settings[10,1])
  label4_select_2 <- as.character(settings[11,1])
  
  #############################################
  ######Label checkbox############
  label_checkbox_1 <- as.character(settings[12,1])
  label_checkbox_2 <- as.character(settings[13,1])
  ################################
  
  ######### Label pie ##############
  label1_pie_1 <- as.character(settings[14,1])
  label1_pie_2 <- as.character(settings[15,1])
  label1_pie_3 <- as.character(settings[16,1])
  label1_pie_4 <- as.character(settings[17,1])
  ##################################
  ######### Label geo ##############
  label1_geo_1 <- as.character(settings[18,1])
  ##################################
  
  ###########Options des différents couches additionnelles#################
  #####Couche 1#####
  if(settings[19,1] == "TRUE"){
    map_stroke_couche_1 <- TRUE
  } else {
    map_stroke_couche_1 <- FALSE
  }
  map_weight_couche_1 <- settings[20,1]
  if(settings[21,1] == "TRUE"){
    map_fill_couche_1 <- TRUE
  } else {
    map_fill_couche_1 <- FALSE
  }
  map_smoothFactor_couche_1 <- settings[22,1]
  map_color_couche_1 <- as.character(settings[23,1])
  map_fillOpacity_couche_1 <- settings[24,1]
  ##################
  #####Couche 2#####
  if(settings[25,1] == "TRUE"){
    map_stroke_couche_2 <- TRUE
  } else {
    map_stroke_couche_2 <- FALSE
  }
  map_weight_couche_2 <- settings[26,1]
  if(settings[27,1] == "TRUE"){
    map_fill_couche_2 <- TRUE
  } else {
    map_fill_couche_2 <- FALSE
  }
  map_smoothFactor_couche_2 <- settings[28,1]
  map_color_couche_2 <- as.character(settings[29,1])
  map_fillOpacity_couche_2 <- settings[30,1]
  ##################
  #####Couche 3#####
  if(settings[31,1] == "TRUE"){
    map_stroke_couche_3 <- TRUE
  } else {
    map_stroke_couche_3 <- FALSE
  }
  map_weight_couche_3 <- settings[32,1]
  if(settings[33,1] == "TRUE"){
    map_fill_couche_3 <- TRUE
  } else {
    map_fill_couche_3 <- FALSE
  }
  map_smoothFactor_couche_3 <- settings[34,1]
  map_color_couche_3 <- as.character(settings[35,1])
  map_fillOpacity_couche_3 <- settings[36,1]
  ##################
  #####Couche 4#####
  if(settings[37,1] == "TRUE"){
    map_stroke_couche_4 <- TRUE
  } else {
    map_stroke_couche_4 <- FALSE
  }
  map_weight_couche_4 <- settings[38,1]
  if(settings[39,1] == "TRUE"){
    map_fill_couche_4 <- TRUE
  } else {
    map_fill_couche_4 <- FALSE
  }
  map_smoothFactor_couche_4 <- settings[40,1]
  map_color_couche_4 <- as.character(settings[41,1])
  map_fillOpacity_couche_4 <- settings[42,1]
  ##################
  #####Options des différents pie chart#####
  map_pie_1_width <- settings[43,1]
  map_pie_2_width <- settings[44,1]
  map_pie_3_width <- settings[45,1]
  map_pie_4_width <- settings[46,1]
  ##########################################
  ############Couleurs des pie_charts###############
  ## Ne changer les couleurs que si vous êtes sur ##
  ## du nombre de paramètres affichés. La taille  ##
  ## du vecteur doit correspondre au nombre de    ##
  ## paramètre affiché.
  
  ###Passer en TRUE si utilisation de ses propres couleurs
  if (settings[47,1] == "TRUE"){
    own_colors <- TRUE
  } else {
    own_colors <- FALSE
  }
  
  
  if (own_colors){
    pal_1 <- str_split(settings[48,1],",") ##Pie_1
    pal_2 <- str_split(settings[49,1],",") ##Pie_2 
    pal_3 <- str_split(settings[50,1],",") ##Pie_3
    pal_4 <- str_split(settings[51,1],",") ##Pie_4
  }
  
  axe_ordonnee <- as.character(settings[52,1])
  axe_abscisse <- as.character(settings[53,1])
  
  ###Lien utile : https://www.code-couleur.com/
} else {
  ##########variables de la page##############
  
  titre_fenetre <- "Test"
  
  logo <-"esi.gif"
  
  logo_lien <- "https://www.facebook.com/esicongo"
  
  
  #############################################
  ######### Titre des onglets #################
  
  titre_onglet1 <- "Affichage des données"
  titre_onglet2 <- "Cartographie des données"
  titre_onglet3 <- "Information sur les espèces"
  titre_onglet4 <- "Protocole"
  #############################################
  
  ######### Label subset ##############
  label1_select_2 <- "subset_1" #Change to label name wanted
  label2_select_2 <- "subset_2" #Change to label name wanted
  label3_select_2 <- "subset_3" #Change to label name wanted
  label4_select_2 <- "subset_4" #Change to label name wanted
  
  #############################################
  ######Label checkbox############
  label_checkbox_1 <- "Afficher les donnees ponderees: nombre d'individus observes divise par le nombre d'observations"
  label_checkbox_2 <- "Afficher l'echelle logarithmique pour l'axe des ordonnées"
  ################################
  
  ######### Label pie ##############
  label1_pie_1 <- "Select pie_1"
  label1_pie_2 <- "Select pie_2"
  label1_pie_3 <- "Select pie_3"
  label1_pie_4 <- "Select pie_4"
  ##################################
  ######### Label geo ##############
  label1_geo_1 <- "Select geo_1"
  ##################################
  
  ###########Options des différents couches additionnelles#################
  #####Couche 1#####
  map_stroke_couche_1 <- TRUE
  map_weight_couche_1 <- 1
  map_fill_couche_1 <- TRUE
  map_smoothFactor_couche_1 <- 1
  map_color_couche_1 <- "green"
  map_fillOpacity_couche_1 <- 0
  ##################
  #####Couche 2#####
  map_stroke_couche_2 <- TRUE
  map_weight_couche_2 <- 1
  map_fill_couche_2 <- TRUE
  map_smoothFactor_couche_2 <- 1
  map_color_couche_2 <- "red"
  map_fillOpacity_couche_2 <- 0
  ##################
  #####Couche 3#####
  map_stroke_couche_3 <- TRUE
  map_weight_couche_3 <- 1
  map_fill_couche_3 <- TRUE
  map_smoothFactor_couche_3 <- 1
  map_color_couche_3 <- "blue"
  map_fillOpacity_couche_3 <- 0
  ##################
  #####Couche 4#####
  map_stroke_couche_4 <- TRUE
  map_weight_couche_4 <- 1
  map_fill_couche_4 <- TRUE
  map_smoothFactor_couche_4 <- 1
  map_color_couche_4 <- "yellow"
  map_fillOpacity_couche_4 <- 0
  ##################
  
  #####Options des différents pie chart#####
  map_pie_1_width <- 70
  map_pie_2_width <- 70
  map_pie_3_width <- 70
  map_pie_4_width <- 70
  
  ##########################################
  ############Couleurs des pie_charts###############
  ## Ne changer les couleurs que si vous êtes sur ##
  ## du nombre de paramètres affichés. La taille  ##
  ## du vecteur doit correspondre au nombre de    ##
  ## paramètre affiché.
  
  ###Passer en TRUE si utilisation de ses propres couleurs
  own_colors <- FALSE 
  
  if (own_colors){
    pal_1 <- c("#3C7AB3") ##Pie_1
    pal_2 <- c("#3C7AB3") ##Pie_2 
    pal_3 <- c("#3C7AB3") ##Pie_3
    pal_4 <- c("#3C7AB3") ##Pie_4
  }
  
  ###Lien utile : https://www.code-couleur.com/
  
  axe_ordonnee <- "Nombre d'occurences"
  axe_abscisse <- "Especes"
}


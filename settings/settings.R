##########variables de la page##############

titre_fenetre <- "Test"

logo <-"esi.gif"

logo_lien <- "https://www.facebook.com/esicongo"


#############################################
######### Titre des onglets #################

titre_onglet1 <- "Vue des données"
titre_onglet2 <- "Spatial viewer"
titre_onglet3 <- "Species information"
#############################################

######### Label subset ##############
label1_select_2 <- "subset_1" #Change to label name wanted
label2_select_2 <- "subset_2" #Change to label name wanted
label3_select_2 <- "subset_3" #Change to label name wanted
label4_select_2 <- "subset_4" #Change to label name wanted

#############################################
######Label checkbox############
label_checkbox_1 <- "Display weighted data : Number of bush meat occurrences divided by number of visits"
label_checkbox_2 <- "Display logarithmic scale for y axis"
################################

######### Label pie ##############
label1_pie_1 <- "Select pie_1"
label1_pie_2 <- "Select pie_2"
label1_pie_3 <- "Select pie_3"
label1_pie_4 <- "Select pie_4"
##################################
######### Label geo ##############
label1_geo_1 <- "Select geo_1"
label1_geo_2 <- "Select geo_2"
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
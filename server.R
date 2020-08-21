# Define server logic 
server <- function(input, output, session) {
  
  
  ######Mise en place de l'UI onglet 1#######
  source("scripts/update_UI_subset.R", local= TRUE)
  ######resetButton#####
  source("scripts/reset_input_button.R",local=TRUE)
  ######################
  ##################################
  
  
  
  ######Mise en place de l'UI onglet 2#######
  source("scripts/update_UI_map_subset.R", local= TRUE)
  source("scripts/update_UI_map_pie.R", local= TRUE)
  source("scripts/update_UI_map_geo.R", local = TRUE)
  ###########################################

  
  
  ######Plotly#####
  output$plotly <- renderPlotly({
    
    ########Filtrage des données en fonction des choix des subsets######
    if(subset_1_valid){
      source("scripts/subset_1_dataCreate.R", local = TRUE)
    } else {
      dat_cut_subset_1 <- dat
    }
    
    if(subset_2_valid){
      source("scripts/subset_2_dataCreate.R", local = TRUE)
    } else {
      dat_cut_subset_2 <- dat_cut_subset_1
    }
    
    if(subset_3_valid){
      source("scripts/subset_3_dataCreate.R", local = TRUE)
    } else {
      dat_cut_subset_3 <- dat_cut_subset_2
    }
    
    if(subset_4_valid){
      source("scripts/subset_4_dataCreate.R", local = TRUE)
    } else {
      dat_cut_subset_4 <- dat_cut_subset_3
    }
    
    ####################################################################
    dat_cut_date <- dat_cut_subset_4
    
    #####Checking date#####
    source("scripts/checking_date.R", local = TRUE)
    #####################
    dat_cut <- dat_cut_date
    
    ######Mise à jour UI########
    source("scripts/Update_UI_2_subset.R", local = TRUE)
    ############################
    
    #####Création dataframe#####
    source("scripts/creation_ban_plot.R", local = TRUE)
    ############################
    
    #####Checking checkbox et affichage#####
    if (input$checkbox) {
      source("scripts/creation_plot_checkbox_valid.R", local=TRUE)
      py_b_an
    } else {
      source("scripts/creation_plot_checkbox_nonvalid.R",local=TRUE)
      py_b_an
    }
    ############################
  })
  
  output$DT <- DT::renderDataTable({
    
    ########Filtrage des données en fonction des choix des subsets######
    
    if(subset_1_valid){
      source("scripts/subset_1_dataCreate_DT.R", local = TRUE)
    } else {
      dat_cut_subset_1_DT <- dat_DT
    }
    
    if(subset_2_valid){
      source("scripts/subset_2_dataCreate_DT.R", local = TRUE)
    } else {
      dat_cut_subset_2_DT <- dat_cut_subset_1_DT
    }
    
    if(subset_3_valid){
      source("scripts/subset_3_dataCreate_DT.R", local = TRUE)
    } else {
      dat_cut_subset_3_DT <- dat_cut_subset_2_DT
    }
    
    if(subset_4_valid){
      source("scripts/subset_4_dataCreate_DT.R", local = TRUE)
    } else {
      dat_cut_subset_4_DT <- dat_cut_subset_3_DT
    }
    
    ####################################################################
    
    #####Checking date#######
    dat_cut_date_DT <- dat_cut_subset_4_DT
    source("scripts/checking_date_DT.R", local = TRUE)
    dat_cut_DT <- dat_cut_date_DT
    ########################
    
    #####Création dataframe#####
    source("scripts/creation_ban_DT.R", local = TRUE)
    ############################
          
    #####Checking checkbox#####
    if (input$checkbox) {
      #####Récupération fréquence/visites######
      jours_visite_annee_DT<-table(substring(unique(dat_DT[,"subset_date~date"]),1,4))
      for (i in names(jours_visite_annee_DT)){
        b_an_DT[which(as.character(b_an_DT[,"annee"]) == i), "Freq"] <- round(b_an_DT[which(as.character(b_an_DT[,"annee"]) == i), "Freq"]/jours_visite_annee_DT[i],2)
      }
      ######################################
      ######Création table#####
      b_an_DT<-cast(b_an_DT,formula = especes~annee,value.var = "Freq")
      DT::datatable(b_an_DT)
      #######################
    }
    else{
      ######Création table######
      b_an_DT<-cast(b_an_DT,formula = especes~annee,value.var = "Freq")
      DT::datatable(b_an_DT)
      #######################
    }
    #################################
  })
  
  #####Spatial viewer######
  
  output$map <- renderLeaflet({
    
    ##########Checking button display pie##########
    source("scripts/map_checking_button.R", local = TRUE)
    ##################################################
    
    
    #########Filtrage donnée en fonction des subsets##########
    if(subset_1_valid){
      source("scripts/map_subset_1_dataCreate.R", local = TRUE)
    } else {
      map_dat_cut_subset_1 <- dat
    }
    
    
    
    if(subset_2_valid){
      source("scripts/map_subset_2_dataCreate.R", local = TRUE)
    } else {
      map_dat_cut_subset_2 <- map_dat_cut_subset_1
    }
    
    if(subset_3_valid){
      source("scripts/map_subset_3_dataCreate.R", local = TRUE)
    } else {
      map_dat_cut_subset_3 <- map_dat_cut_subset_2
    }
    
    if(subset_4_valid){
      source("scripts/map_subset_4_dataCreate.R", local = TRUE)
    } else {
      map_dat_cut_subset_4 <- map_dat_cut_subset_3
    }
    #############################################################
    
    #####Checking date#####
    map_dat_cut_date <- map_dat_cut_subset_4
    source("scripts/map_checking_date.R", local = TRUE)
    #######################
    map_dat_cut <- map_dat_cut_date
    
    ######Update UI onglet 2########
    source("scripts/Update_UI_2_map_subset.R", local = TRUE)
    ################################
    
    #######Checking geo_1/geo_2######
    source("scripts/map_geo_1_dataCreate.R", local = TRUE)
    #################################
    
    ##########Message d'erreur si pas de coordonnées######
    shiny::validate(
      need(cent_valid == TRUE,"Pas de colonne geo_2_long~longitude et geo_2_lat~latitude ou pas de fichier geojson")
    )
    ######################################################
    
    #####Récupération coordonnées#######
    cent<-aggregate(map_dat_cut[,c(grep("^geo_2_lat", names(map_dat_cut)), grep("^geo_2_long", names(map_dat_cut)))], list(map_dat_cut[,grep("^geo_2~", names(map_dat_cut))]), mean)
    names(cent) <- c("name","lat","lng")
    map_center_lng <- mean(cent[,"lng"], na.rm = TRUE)
    map_center_lat <- mean(cent[,"lat"], na.rm = TRUE)
    max_lng <- max(cent[,"lng"], na.rm = TRUE)
    min_lng <- min(cent[,"lng"], na.rm = TRUE)
    max_lat <- max(cent[,"lat"], na.rm = TRUE)
    min_lat <- min(cent[,"lat"], na.rm = TRUE)
    map_dat_cut[,geo_2_names] <- factor(map_dat_cut[,geo_2_names], exclude = NULL)
    ###################################
    
    #####Checking pie#####
    if(pie_1_valid){
      source("scripts/map_pie_1_datacreate.r", local=TRUE)
    }
    
    if(pie_2_valid){
      source("scripts/map_pie_2_datacreate.r", local=TRUE)
    }
    
    if(pie_3_valid){
      source("scripts/map_pie_3_datacreate.r", local=TRUE)
    }
    
    if(pie_4_valid){
      source("scripts/map_pie_4_datacreate.r", local=TRUE)
    }
    ########################
    
    ########Création map#####
    tilesURL <- "https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png"
    
    prot_geo <- leaflet() %>%
      addTiles(tilesURL) %>% #Add default OpenStreetMap map tiles
      fitBounds(max_lng,max_lat,min_lng,min_lat)
    ###########################
    
    ########Ajout couche additionnelle###############
     if(exists("couche_1")){
       prot_geo <- addPolygons(prot_geo,data=couche_1, stroke = map_stroke_couche_1, weight = map_weight_couche_1, fill = map_fill_couche_1, color = ~map_color_couche_1, smoothFactor = map_smoothFactor_couche_1, fillOpacity = map_fillOpacity_couche_1)
     }
     
     if(exists("couche_2")){
       prot_geo <- addPolygons(prot_geo,data=couche_2, stroke = map_stroke_couche_2, weight = map_weight_couche_2, fill = map_fill_couche_2, color = ~map_color_couche_2, smoothFactor = map_smoothFactor_couche_2, fillOpacity = map_fillOpacity_couche_2) 
     }
     
     if(exists("couche_3")){
       prot_geo <- addPolygons(prot_geo,data=couche_3, stroke = map_stroke_couche_3, weight = map_weight_couche_3, fill = map_fill_couche_3, color = ~map_color_couche_3, smoothFactor = map_smoothFactor_couche_3, fillOpacity = map_fillOpacity_couche_3)
     }
     
     if(exists("couche_4")){
       prot_geo <- addPolygons(prot_geo,data=couche_4, stroke = map_stroke_couche_4, weight = map_weight_couche_4, fill = map_fill_couche_4, color = ~map_color_couche_4, smoothFactor = map_smoothFactor_couche_4, fillOpacity = map_fillOpacity_couche_4)
     }
    ################################################
    
    ####Création mini_pie_charts#####
    if(pie_1_valid){
      source("scripts/map_pie_1_creation.r",local= TRUE)
    }
    
    if(pie_2_valid){
      source("scripts/map_pie_2_creation.r",local= TRUE)
    }
    
    if(pie_3_valid){
      source("scripts/map_pie_3_creation.r",local= TRUE)
    }
    
    if(pie_4_valid){
      source("scripts/map_pie_4_creation.r",local= TRUE)
    }
    ##################################
    prot_geo
    
  })
  
  ######iFrame######
  
  observeEvent(input$species,{
    if (input$species == ""){
      output$frame <- renderUI({
        tags$iframe(src="https://species.wikimedia.org/wiki",height = 1200, width = 1600, frameborder = "no")
      })
    } else {
      name <- as.character(input$species)
      link <<- paste0("https://species.wikimedia.org/wiki",name)
      output$frame <- renderUI({
        tags$iframe(src=link,height = 1200,width = 1600,frameborder = "no")
      })
      url <- a(tags$h3("More informations about this species"), href = as.character(unique(dat[which(dat[,wikisp_names] == name),link_names])),target = "_blank")
      output$`More informations` <- renderUI({
        tagList(url)
      })
    }
  })
}

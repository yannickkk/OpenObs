# Define server logic 
server <- function(input, output, session) {
  
  
  ######Mise en place de l'UI onglet 1#######
  source("scripts/update_UI_subset.R", local= TRUE)
  ##################################
  
  ######resetButton#####
  source("scripts/reset_input_button.R",local=TRUE)

  
  
  ######Plotly#####
  output$plotly <- renderPlotly({
    
    
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
    
    #####Checking checkbox#####
    if (input$checkbox) {
      source("scripts/creation_plot_checkbox_valid.R", local=TRUE)
      py_b_an
      ############################
    } else {
      source("scripts/creation_plot_checkbox_nonvalid.R",local=TRUE)
      py_b_an
      ############################
    }

  })
  
  output$DT <- DT::renderDataTable({
    
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
    
    
    #####Checking date#######
    dat_cut_date_DT <- dat_cut_subset_4_DT
    source("scripts/checking_date_DT.R", local = TRUE)
    dat_cut_DT <- dat_cut_date_DT
    ########################
    
    #####Création dataframe#####
    source("scripts/creation_ban_DT.R", local = TRUE)
    ############################
          
    ############################
    #####Checking checkbox#####
    if (input$checkbox) {
      #####RC)cupC)ration frC)quence/visites######
      if (date_valid){
        jours_visite_annee_DT<-table(substring(unique(dat_DT[,"subset_date~date"]),1,4))
      } else {
        jours_visite_annee_DT<-table(substring(unique(dat_DT[,"subset_date~date"]),7,10))
      }
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
      ######CrC)ation table######
      b_an_DT<-cast(b_an_DT,formula = especes~annee,value.var = "Freq")
      DT::datatable(b_an_DT)
      #######################
    }
    ######################
  })
  
  #####Spatial viewer######
  
  ######Mise en place de l'UI onglet 2#######
  source("scripts/update_UI_map_subset.R", local= TRUE)
  source("scripts/update_UI_map_pie.R", local= TRUE)
  source("scripts/update_UI_map_geo.R", local = TRUE)
  ##################################
  
  output$map <- renderLeaflet({
    
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
    
    #####Checking date#####
    map_dat_cut_date <- map_dat_cut_subset_4
    source("scripts/map_checking_date.R", local = TRUE)
    #######################
    map_dat_cut <- map_dat_cut_date
  
    source("scripts/Update_UI_2_map_subset.R", local = TRUE)
    
    ############################################
    #######Checking geo_1######
    
    source("scripts/map_geo_1_dataCreate.R", local = TRUE)
    
    ###########################
    
    
    #####Récupération coordonnée#######
    cent<-aggregate(dat[,c(grep("^geo_2_lat", names(dat)), grep("^geo_2_long", names(dat)))], list(dat[,grep("^geo_2~", names(dat))]), mean)
    names(cent) <- c("name","lat","lng")
    map_center_lng <- mean(cent[,"lng"])
    map_center_lat <- mean(cent[,"lat"])
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
    
    tilesURL <- "https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png"
    
    prot_geo <- leaflet() %>%
      addTiles(tilesURL) %>% #Add default OpenStreetMap map tiles
      setView(lng = map_center_lng, lat = map_center_lat,zoom = 8)
    
    ####Création map pie_1#####
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
    
    prot_geo
    
  })
}

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
    
    #####################
    dat_cut <- dat_cut_date
    
    #####################
    
    
    
    source("scripts/Update_UI_2_subset.R", local = TRUE)
    
    
    if (date_valid){
      annee_cut<-substring(dat_cut[,"subset_date~date"],1,4)
    } else {
      annee_cut<-substring(dat_cut[,"subset_date~date"],7,10)
    }
    
    b_an <- data.frame(table(tolower(dat_cut[,x_axis_names]),dat_cut$'quantity~quantite',annee_cut))
    b_an$Var2 <- as.numeric(b_an$Var2)
    b_an$freq <- as.numeric(b_an$Freq)
    b_an$Freq <- b_an$Var2*b_an$Freq
    b_an <- b_an[,-2]
    
    
    shiny::validate(
      need(length(b_an) != 2, "Loading..")
    )
    
    b_an <- b_an %>%
      group_by(Var1,annee_cut) %>%
      summarise(Freq = sum(Freq))
    
    b_an <- data.frame(b_an)
    names(b_an) <- c('especes','annee','Freq')
    #####Checking checkbox#####
    if (input$checkbox) {
      if (date_valid){
        jours_visite_annee<-table(substring(unique(dat_cut[,"subset_date~date"]),1,4))
      } else {
        jours_visite_annee<-table(substring(unique(dat_cut[,"subset_date~date"]),7,10))
      }
      for (i in names(jours_visite_annee)) {
        b_an[which(as.character(b_an[,"annee"]) == i), "Freq"] <- round(b_an[which(as.character(b_an[,"annee"]) == i), "Freq"]/jours_visite_annee[i],2)
      }
      #####Checking log#####
      if(input$checkboxlog){
        for (i in 1:nrow(b_an)) {
          b_an[i,3] <- log(1+b_an[i,3])
        }
        yaxis <- list(
          title = 'log(meat occurrences/nber of visits)',
          cex.axis =0.5,
          cex.lab = 0.5
        )
      } else {
        yaxis <- list(
          title = 'meat occurrences/number of visits',
          cex.axis =0.5,
          cex.lab = 0.5
        )
      }
      ####################
      ####Création du graphique####
      py_b_an <- plot_ly(type = 'bar') %>%
        layout(yaxis = yaxis, margin = m,xaxis = xaxis, barmode = "stack")
      for (i in dates) {
        if (i%in%unique(annee_cut)){
          py_b_an<- add_trace(py_b_an,x = ~unique(b_an[,"especes"]),y = b_an[which(b_an[,"annee"] == i),"Freq"], name = i)
        }
      }
      py_b_an
      ############################
    } else {
      #####Checking log#####
      if(input$checkboxlog){
        for (i in 1:nrow(b_an)){
          b_an[i,3] <- log(1+b_an[i,3])
          
        }
        yaxis <- list(
          title = 'log(meat occurrences)',
          cex.axis =0.5,
          cex.lab = 0.5
        )
      } else {
        yaxis <- list(
          title = 'meat occurrences',
          cex.axis =0.5,
          cex.lab = 0.5
        )
      }
      ####################
      ####CrC)ation du graphique####
      py_b_an <- plot_ly(type = 'bar') %>%
        layout(yaxis = yaxis, margin = m,xaxis = xaxis, barmode = "stack")
      for (i in dates) {
        if (i%in%unique(annee_cut)){
          py_b_an<- add_trace(py_b_an,x = ~unique(b_an[,"especes"]),y = b_an[which(b_an[,"annee"] == i),"Freq"], name = i)
        }
      }
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
    
    if (date_valid){
      annee_DT <- substring(dat_cut_DT[,"subset_date~date"],1,4)
    } else {
      annee_DT <- substring(dat_cut_DT[,"subset_date~date"],7,10)
    }

    b_an_DT <- data.frame(table(dat_cut_DT[,x_axis_names],dat_cut_DT$'quantity~quantite',annee_DT))
    b_an_DT$Var2 <- as.numeric(b_an_DT$Var2)
    b_an_DT$freq <- as.numeric(b_an_DT$Freq)
    b_an_DT$Freq <- b_an_DT$Var2*b_an_DT$Freq
    b_an_DT <- b_an_DT[,-2]
    b_an_DT <- b_an_DT %>%
      group_by(Var1,annee_DT) %>%
      summarise(Freq = sum(Freq))
    
    b_an_DT <- data.frame(b_an_DT)
    names(b_an_DT)<-c("especes","annee","Freq")
          
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
    
    
    pal <- colorNumeric(c("red","green","blue"),1:length(levels(map_df_pie_1$pie_1)))
    tilesURL <- "https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png"
    
    prot_geo <- leaflet() %>%
      addTiles(tilesURL) %>% #Add default OpenStreetMap map tiles
      setView(lng = map_center_lng, lat = map_center_lat,zoom = 8) %>%
      addLegend("topright", title = map_pie_1_value, labels = levels(map_df_pie_1$pie_1),opacity = 0.7,colors = pal(1:length(levels(map_df_pie_1$pie_1))))
    
    
    ####Création map pie_1#####
    if(pie_1_valid){
      source("scripts/map_pie_1_creation.r",local= TRUE)
    }
    
    prot_geo
    
  })
}

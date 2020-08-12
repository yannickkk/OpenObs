# Define server logic 
server <- function(input, output, session) {
  
  ######Mise en place de l'UI#######
  source("scripts/update_UI_subset.R", local= TRUE)
  
  #####################################
  
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
    
    #####Checking date#####
    source("scripts/checking_date.R", local = TRUE)
    ######################
    
    #####################
    dat_cut <- dat_cut_subset_4
    
    annee_cut<-substring(dat_cut[,"subset_date~date"],1,4)
    b_an <- data.frame(table(tolower(dat_cut[,x_axis_names]),dat_cut$'quantity~quantite',annee_cut))
    b_an$Var2 <- as.numeric(b_an$Var2)
    b_an$freq <- as.numeric(b_an$Freq)
    b_an$Freq <- b_an$Var2*b_an$Freq
    b_an <- b_an[,-2]
    b_an <- b_an %>%
      group_by(Var1,annee_cut) %>%
      summarise(Freq = sum(Freq))
    
    b_an <- data.frame(b_an)
    names(b_an) <- c('especes','annee','Freq')
    #####Checking checkbox#####
    if (input$checkbox) {
      
      jours_visite_annee<-table(substring(unique(dat_cut[,"subset_date~date"]),1,4))
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
    
    dat_cut_DT <- dat_cut_subset_4_DT
    
    annee_DT <- substring(dat_cut_DT[,"subset_date~date"],1,4)
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
      ######CrC)ation table######
      b_an_DT<-cast(b_an_DT,formula = especes~annee,value.var = "Freq")
      DT::datatable(b_an_DT)
      #######################
    }
    ######################
  })
}

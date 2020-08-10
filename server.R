# Define server logic 
server <- function(input, output, session) {
  
  if (!subset_2){
    observe({
      subset_2_1_value <- input$subset_2_1
      updateSelectInput(session,"subset_2_2",label = paste('Select ',subset_2_1_value),choices = c("whole",levels(dat[,paste("subset_2.",subset_2_1_value,sep="")])),selected ="whole")
    })
  }
  ######Plotly#####
  output$plotly <- renderPlotly({
    
    #####Checking subset_2####
    if(subset_2){
      subset_2_value <- input$subset_2
      if("whole"%in%subset_2_value & length(subset_2_value) > 1) {
        observe({
          updateSelectInput(session,"subset_2",label = label1_select_2, choices = c("whole",levels(dat[,subset_2_names])),selected = subset_2_value[2])
        })
      }
      dat_cut_subset_2<- dat
      if ("whole"%in%subset_2_value){
        dat_cut_subset_2 <- dat
      } else {
        dat_cut_subset_2 <- dat[which(dat[,subset_2_names] == subset_2_value[1]),]
        if (length(subset_2_value) > 1){
          for (i in 2:length(subset_2_value)){
            dat_cut_subset_2 <- rbind(dat_cut_subset_2,dat[which(dat[,subset_2_names] == subset_2_value[i]),])
          }
        }
        dat_cut_subset_2[,subset_2_names] <- factor(dat_cut_subset_2[,subset_2_names],exclude=NULL)
      }
      #############
    } else {
      #####Multiple#####
      
      subset_2_2_value <- input$subset_2_2
      
      if ("whole"%in%subset_2_2_value & length(subset_2_2_value) > 1) {
        if(subset_2_2_value[1] == "whole") {
          observe({
            updateSelectInput(session,"subset_2_2",label = paste('Select ',subset_2_1_value),choices = c("whole",levels(dat[,paste("subset_2.",subset_2_1_value,sep="")])),selected = subset_2_2_value[2])
          })
        } else {
          observe({
            updateSelectInput(session,"subset_2_2",label = paste('Select ',subset_2_1_value),choices = c("whole",levels(dat[,paste("subset_2.",subset_2_1_value,sep="")])),selected = subset_2_2_value[length(subset_2_2_value)])
          })
        }
        
      }
      
      subset_2_1_value <- input$subset_2_1
      
      
      dat_cut_subset_2 <- dat
      if ("whole"%in%subset_2_2_value){
        dat_cut_subset_2 <- dat
      } else {
        dat_cut_subset_2 <- dat[which(dat[,paste("subset_2.",subset_2_1_value,sep="")] == subset_2_2_value[1]),]
        if (length(subset_2_2_value)>1){
          for (i in 2:length(subset_2_2_value)){
            dat_cut_subset_2 <- rbind(dat_cut_subset_2,dat[which(dat[,paste("subset_2.",subset_2_1_value,sep="")] == subset_2_2_value[i]),])
          }
        }
        dat_cut_subset_2[,"subset_2.espece"] <- factor(dat_cut_subset_2[,"subset_2.espece"],exclude=NULL)
      }
    }
    ########################
    #####Checking date#####
    dates_2 <- as.numeric(substring(input$dates,1,4))
    i <- dates_2[1]
    dates <- as.character(i)
    i <- i+1
    while (i != dates_2[2]+1) {
      dates <- c(dates,as.character(i))
      i <- i+1
    }
    
    #####################
    dat_cut <- dat_cut_subset_2
    annee_cut<-substring(dat_cut[,"subset_date.date"],1,4)
    b_an <- data.frame(table(tolower(dat_cut$subset_2.espece),dat_cut$QUANTITE,annee_cut))
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
      
      jours_visite_annee<-table(substring(unique(dat_cut[,"subset_date.date"]),1,4))
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
}

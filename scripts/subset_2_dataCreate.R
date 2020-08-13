#####Checking subset_2####
if(subset_2){
  subset_2_value <- input$subset_2
  if("whole"%in%subset_2_value & length(subset_2_value) > 1) {
    observe({
      dat_cut_subset_1[,subset_2_names] <- factor(dat_cut_subset_1[,subset_2_names])
      updateSelectInput(session,"subset_2",label = label2_select_1, choices = c("whole",levels(dat_cut_subset_1[,subset_2_names])),selected = subset_2_value[2])
    })
  }
  dat_cut_subset_2<- dat_cut_subset_1
  if ("whole"%in%subset_2_value){
    dat_cut_subset_2 <- dat_cut_subset_1
  } else {
    dat_cut_subset_2 <- dat_cut_subset_1[which(dat_cut_subset_1[,subset_2_names] == subset_2_value[1]),]
    if (length(subset_2_value) > 1){
      for (i in 2:length(subset_2_value)){
        dat_cut_subset_2 <- rbind(dat_cut_subset_2,dat_cut_subset_1[which(dat_cut_subset_1[,subset_2_names] == subset_2_value[i]),])
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
        dat_cut_subset_1[,paste("subset_2~",subset_2_1_value,sep="")] <- factor(dat_cut_subset_1[,paste("subset_2~",subset_2_1_value,sep="")])
        updateSelectInput(session,"subset_2_2",label = paste('Select ',subset_2_1_value),choices = c("whole",levels(dat_cut_subset_1[,paste("subset_2~",subset_2_1_value,sep="")])),selected = subset_2_2_value[2])
      })
    } else {
      observe({
        dat_cut_subset_1[,paste("subset_2~",subset_2_1_value,sep="")] <- factor(dat_cut_subset_1[,paste("subset_2~",subset_2_1_value,sep="")])
        updateSelectInput(session,"subset_2_2",label = paste('Select ',subset_2_1_value),choices = c("whole",levels(dat_cut_subset_1[,paste("subset_2~",subset_2_1_value,sep="")])),selected = subset_2_2_value[length(subset_2_2_value)])
      })
    }
    
  }
  
  subset_2_1_value <- input$subset_2_1
  
  
  dat_cut_subset_2 <- dat_cut_subset_1
  if ("whole"%in%subset_2_2_value){
    dat_cut_subset_2 <- dat_cut_subset_1
  } else {
    dat_cut_subset_2 <- dat_cut_subset_1[which(dat_cut_subset_1[,paste("subset_2~",subset_2_1_value,sep="")] == subset_2_2_value[1]),]
    if (length(subset_2_2_value)>1){
      for (i in 2:length(subset_2_2_value)){
        dat_cut_subset_2 <- rbind(dat_cut_subset_2,dat_cut_subset_1[which(dat_cut_subset_1[,paste("subset_2~",subset_2_1_value,sep="")] == subset_2_2_value[i]),])
      }
    }
    dat_cut_subset_2[,x_axis_names] <- factor(dat_cut_subset_2[,x_axis_names],exclude=NULL)
  }
}
########################
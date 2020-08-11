#####Checking subset_4####
if(subset_4){
  subset_4_value <- input$subset_4
  if("whole"%in%subset_4_value & length(subset_4_value) > 1) {
    observe({
      updateSelectInput(session,"subset_4",label = label4_select_1, choices = c("whole",levels(dat[,subset_4_names])),selected = subset_4_value[2])
    })
  }
  dat_cut_subset_4<- dat
  if ("whole"%in%subset_4_value){
    dat_cut_subset_4 <- dat
  } else {
    dat_cut_subset_4 <- dat[which(dat[,subset_4_names] == subset_4_value[1]),]
    if (length(subset_4_value) > 1){
      for (i in 2:length(subset_4_value)){
        dat_cut_subset_4 <- rbind(dat_cut_subset_4,dat[which(dat[,subset_4_names] == subset_4_value[i]),])
      }
    }
    dat_cut_subset_4[,subset_4_names] <- factor(dat_cut_subset_4[,subset_4_names],exclude=NULL)
  }
  #############
} else {
  #####Multiple#####
  subset_4_2_value <- input$subset_4_2
  
  if ("whole"%in%subset_4_2_value & length(subset_4_2_value) > 1) {
    if(subset_4_2_value[1] == "whole") {
      observe({
        updateSelectInput(session,"subset_4_2",label = paste('Select ',subset_4_1_value),choices = c("whole",levels(dat[,paste("subset_4.",subset_4_1_value,sep="")])),selected = subset_4_2_value[2])
      })
    } else {
      observe({
        updateSelectInput(session,"subset_4_2",label = paste('Select ',subset_4_1_value),choices = c("whole",levels(dat[,paste("subset_4.",subset_4_1_value,sep="")])),selected = subset_4_2_value[length(subset_4_2_value)])
      })
    }
    
  }
  
  subset_4_1_value <- input$subset_4_1
  
  
  dat_cut_subset_4 <- dat
  if ("whole"%in%subset_4_2_value){
    dat_cut_subset_4 <- dat
  } else {
    dat_cut_subset_4 <- dat[which(dat[,paste("subset_4.",subset_4_1_value,sep="")] == subset_4_2_value[1]),]
    if (length(subset_4_2_value)>1){
      for (i in 2:length(subset_4_2_value)){
        dat_cut_subset_4 <- rbind(dat_cut_subset_4,dat[which(dat[,paste("subset_4.",subset_4_1_value,sep="")] == subset_4_2_value[i]),])
      }
    }
    dat_cut_subset_4[,x_axis_names] <- factor(dat_cut_subset_4[,x_axis_names],exclude=NULL)
  }
}
########################
#####Checking subset_3####
if(subset_3){
  subset_3_value <- input$subset_3
  if("whole"%in%subset_3_value & length(subset_3_value) > 1) {
    observe({
      updateSelectInput(session,"subset_3",label = label3_select_1, choices = c("whole",levels(dat[,subset_3_names])),selected = subset_3_value[2])
    })
  }
  dat_cut_subset_3<- dat
  if ("whole"%in%subset_3_value){
    dat_cut_subset_3 <- dat
  } else {
    dat_cut_subset_3 <- dat[which(dat[,subset_3_names] == subset_3_value[1]),]
    if (length(subset_3_value) > 1){
      for (i in 2:length(subset_3_value)){
        dat_cut_subset_3 <- rbind(dat_cut_subset_3,dat[which(dat[,subset_3_names] == subset_3_value[i]),])
      }
    }
    dat_cut_subset_3[,subset_3_names] <- factor(dat_cut_subset_3[,subset_3_names],exclude=NULL)
  }
  #############
} else {
  #####Multiple#####
  subset_3_2_value <- input$subset_3_2
  
  if ("whole"%in%subset_3_2_value & length(subset_3_2_value) > 1) {
    if(subset_3_2_value[1] == "whole") {
      observe({
        updateSelectInput(session,"subset_3_2",label = paste('Select ',subset_3_1_value),choices = c("whole",levels(dat[,paste("subset_3.",subset_3_1_value,sep="")])),selected = subset_3_2_value[2])
      })
    } else {
      observe({
        updateSelectInput(session,"subset_3_2",label = paste('Select ',subset_3_1_value),choices = c("whole",levels(dat[,paste("subset_3.",subset_3_1_value,sep="")])),selected = subset_3_2_value[length(subset_3_2_value)])
      })
    }
    
  }
  
  subset_3_1_value <- input$subset_3_1
  
  
  dat_cut_subset_3 <- dat
  if ("whole"%in%subset_3_2_value){
    dat_cut_subset_3 <- dat
  } else {
    dat_cut_subset_3 <- dat[which(dat[,paste("subset_3.",subset_3_1_value,sep="")] == subset_3_2_value[1]),]
    if (length(subset_3_2_value)>1){
      for (i in 2:length(subset_3_2_value)){
        dat_cut_subset_3 <- rbind(dat_cut_subset_3,dat[which(dat[,paste("subset_3.",subset_3_1_value,sep="")] == subset_3_2_value[i]),])
      }
    }
    dat_cut_subset_3[,x_axis_names] <- factor(dat_cut_subset_3[,x_axis_names],exclude=NULL)
  }
}
########################
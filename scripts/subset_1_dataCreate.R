#####Checking subset_1####
if(subset_1){
  subset_1_value <- input$subset_1
  if("whole"%in%subset_1_value & length(subset_1_value) > 1) {
    observe({
      updateSelectInput(session,"subset_1",label = label1_select_1, choices = c("whole",levels(dat[,subset_1_names])),selected = subset_1_value[2])
    })
  }
  dat_cut_subset_1<- dat
  if ("whole"%in%subset_1_value){
    dat_cut_subset_1 <- dat
  } else {
    dat_cut_subset_1 <- dat[which(dat[,subset_1_names] == subset_1_value[1]),]
    if (length(subset_1_value) > 1){
      for (i in 2:length(subset_1_value)){
        dat_cut_subset_1 <- rbind(dat_cut_subset_1,dat[which(dat[,subset_1_names] == subset_1_value[i]),])
      }
    }
    dat_cut_subset_1[,subset_1_names] <- factor(dat_cut_subset_1[,subset_1_names],exclude=NULL)
  }
  #############
} else {
  #####Multiple#####
  subset_1_2_value <- input$subset_1_2
  
  if ("whole"%in%subset_1_2_value & length(subset_1_2_value) > 1) {
    if(subset_1_2_value[1] == "whole") {
      observe({
        updateSelectInput(session,"subset_1_2",label = paste('Select ',subset_1_1_value),choices = c("whole",levels(dat[,paste("subset_1~",subset_1_1_value,sep="")])),selected = subset_1_2_value[2])
      })
    } else {
      observe({
        updateSelectInput(session,"subset_1_2",label = paste('Select ',subset_1_1_value),choices = c("whole",levels(dat[,paste("subset_1~",subset_1_1_value,sep="")])),selected = subset_1_2_value[length(subset_1_2_value)])
      })
    }
    
  }
  
  subset_1_1_value <- input$subset_1_1
  
  
  dat_cut_subset_1 <- dat
  if ("whole"%in%subset_1_2_value){
    dat_cut_subset_1 <- dat
  } else {
    dat_cut_subset_1 <- dat[which(dat[,paste("subset_1~",subset_1_1_value,sep="")] == subset_1_2_value[1]),]
    if (length(subset_1_2_value)>1){
      for (i in 2:length(subset_1_2_value)){
        dat_cut_subset_1 <- rbind(dat_cut_subset_1,dat[which(dat[,paste("subset_1~",subset_1_1_value,sep="")] == subset_1_2_value[i]),])
      }
    }
    dat_cut_subset_1[,x_axis_names] <- factor(dat_cut_subset_1[,x_axis_names],exclude=NULL)
  }
}
########################
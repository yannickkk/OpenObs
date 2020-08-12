#####Checking subset_1####
if(subset_1){
  subset_1_value_DT <- input$subset_1
  dat_cut_subset_1_DT <- dat_DT
  if ("whole"%in%subset_1_value_DT){
    dat_cut_subset_1_DT <- dat_DT
  } else {
    dat_cut_subset_1_DT <- dat_DT[which(dat_DT[,subset_1_names] == subset_1_value_DT[1]),]
    if (length(subset_1_value_DT) > 1){
      for (i in 2:length(subset_1_value_DT)){
        dat_cut_subset_1_DT <- rbind(dat_cut_subset_1_DT,dat_DT[which(dat_DT[,subset_1_names] == subset_1_value_DT[i]),])
      }
    }
    dat_cut_subset_1_DT[,subset_1_names] <- factor(dat_cut_subset_1_DT[,subset_1_names],exclude=NULL)
  }
  #############
} else {
  #####Multiple#####
  subset_1_2_value_DT <- input$subset_1_2
  subset_1_1_value_DT <- input$subset_1_1
  
  dat_cut_subset_1_DT <- dat_DT
  if ("whole"%in%subset_1_2_value_DT){
    dat_cut_subset_1_DT <- dat_DT
  } else {
    dat_cut_subset_1_DT <- dat_DT[which(dat_DT[,paste("subset_1~",subset_1_1_value_DT,sep="")] == subset_1_2_value_DT[1]),]
    if (length(subset_1_2_value_DT)>1){
      for (i in 2:length(subset_1_2_value_DT)){
        dat_cut_subset_1_DT <- rbind(dat_cut_subset_1_DT,dat_DT[which(dat_DT[,paste("subset_1~",subset_1_1_value_DT,sep="")] == subset_1_2_value_DT[i]),])
      }
    }
    dat_cut_subset_1_DT[,x_axis_names] <- factor(dat_cut_subset_1_DT[,x_axis_names],exclude=NULL)
  }
}
########################
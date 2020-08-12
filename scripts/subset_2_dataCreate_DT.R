#####Checking subset_2####
if(subset_2){
  subset_2_value_DT <- input$subset_2
  dat_cut_subset_2_DT <- dat_cut_subset_1_DT
  if ("whole"%in%subset_2_value_DT){
    dat_cut_subset_2_DT <- dat_cut_subset_1_DT
  } else {
    dat_cut_subset_2_DT <- dat_cut_subset_1_DT[which(dat_cut_subset_1_DT[,subset_2_names] == subset_2_value_DT[1]),]
    if (length(subset_2_value_DT) > 1){
      for (i in 2:length(subset_2_value_DT)){
        dat_cut_subset_2_DT <- rbind(dat_cut_subset_2_DT,dat_cut_subset_1_DT[which(dat_cut_subset_1_DT[,subset_2_names] == subset_2_value_DT[i]),])
      }
    }
    dat_cut_subset_2_DT[,subset_2_names] <- factor(dat_cut_subset_2_DT[,subset_2_names],exclude=NULL)
  }
  #############
} else {
  #####Multiple#####
  subset_2_2_value_DT <- input$subset_2_2
  subset_2_1_value_DT <- input$subset_2_1
  
  dat_cut_subset_2_DT <- dat_cut_subset_1_DT
  if ("whole"%in%subset_2_2_value_DT){
    dat_cut_subset_2_DT <- dat_cut_subset_1_DT
  } else {
    dat_cut_subset_2_DT <- dat_cut_subset_1_DT[which(dat_cut_subset_1_DT[,paste("subset_2~",subset_2_1_value_DT,sep="")] == subset_2_2_value_DT[1]),]
    if (length(subset_2_2_value_DT)>1){
      for (i in 2:length(subset_2_2_value_DT)){
        dat_cut_subset_2_DT <- rbind(dat_cut_subset_2_DT,dat_cut_subset_1_DT[which(dat_cut_subset_1_DT[,paste("subset_2~",subset_2_1_value_DT,sep="")] == subset_2_2_value_DT[i]),])
      }
    }
    dat_cut_subset_2_DT[,x_axis_names] <- factor(dat_cut_subset_2_DT[,x_axis_names],exclude=NULL)
  }
}
########################
#####Checking subset_3####
if(subset_3){
  subset_3_value_DT <- input$subset_3
  dat_cut_subset_3_DT <- dat_cut_subset_2_DT
  if ("tous"%in%subset_3_value_DT){
    dat_cut_subset_3_DT <- dat_cut_subset_2_DT
  } else {
    dat_cut_subset_3_DT <- dat_cut_subset_2_DT[which(dat_cut_subset_2_DT[,subset_3_names] == subset_3_value_DT[1]),]
    if (length(subset_3_value_DT) > 1){
      for (i in 2:length(subset_3_value_DT)){
        dat_cut_subset_3_DT <- rbind(dat_cut_subset_3_DT,dat_cut_subset_2_DT[which(dat_cut_subset_2_DT[,subset_3_names] == subset_3_value_DT[i]),])
      }
    }
    dat_cut_subset_3_DT[,subset_3_names] <- factor(dat_cut_subset_3_DT[,subset_3_names],exclude=NULL)
  }
  #############
} else {
  #####Multiple#####
  subset_3_2_value_DT <- input$subset_3_2
  subset_3_1_value_DT <- input$subset_3_1
  
  dat_cut_subset_3_DT <- dat_cut_subset_2_DT
  if ("tous"%in%subset_3_2_value_DT){
    dat_cut_subset_3_DT <- dat_cut_subset_2_DT
  } else {
    dat_cut_subset_3_DT <- dat_cut_subset_2_DT[which(dat_cut_subset_2_DT[,paste("subset_3~",subset_3_1_value_DT,sep="")] == subset_3_2_value_DT[1]),]
    if (length(subset_3_2_value_DT)>1){
      for (i in 2:length(subset_3_2_value_DT)){
        dat_cut_subset_3_DT <- rbind(dat_cut_subset_3_DT,dat_cut_subset_2_DT[which(dat_cut_subset_2_DT[,paste("subset_3~",subset_3_1_value_DT,sep="")] == subset_3_2_value_DT[i]),])
      }
    }
    dat_cut_subset_3_DT[,x_axis_names] <- factor(dat_cut_subset_3_DT[,x_axis_names],exclude=NULL)
  }
}
########################
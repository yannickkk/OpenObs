#####Checking subset_4####
if(subset_4){
  subset_4_value_DT <- input$subset_4
  dat_cut_subset_4_DT <- dat_cut_subset_3_DT
  if ("whole"%in%subset_4_value_DT){
    dat_cut_subset_4_DT <- dat_cut_subset_3_DT
  } else {
    dat_cut_subset_4_DT <- dat_cut_subset_3_DT[which(dat_cut_subset_3_DT[,subset_4_names] == subset_4_value_DT[1]),]
    if (length(subset_4_value_DT) > 1){
      for (i in 2:length(subset_4_value_DT)){
        dat_cut_subset_4_DT <- rbind(dat_cut_subset_4_DT,dat_cut_subset_3_DT[which(dat_cut_subset_3_DT[,subset_4_names] == subset_4_value_DT[i]),])
      }
    }
    dat_cut_subset_4_DT[,subset_4_names] <- factor(dat_cut_subset_4_DT[,subset_4_names],exclude=NULL)
  }
  #############
} else {
  #####Multiple#####
  subset_4_2_value_DT <- input$subset_4_2
  subset_4_1_value_DT <- input$subset_4_1
  
  dat_cut_subset_4_DT <- dat_cut_subset_3_DT
  if ("whole"%in%subset_4_2_value_DT){
    dat_cut_subset_4_DT <- dat_cut_subset_3_DT
  } else {
    dat_cut_subset_4_DT <- dat_cut_subset_3_DT[which(dat_cut_subset_3_DT[,paste("subset_4~",subset_4_1_value_DT,sep="")] == subset_4_2_value_DT[1]),]
    if (length(subset_4_2_value_DT)>1){
      for (i in 2:length(subset_4_2_value_DT)){
        dat_cut_subset_4_DT <- rbind(dat_cut_subset_4_DT,dat_cut_subset_3_DT[which(dat_cut_subset_3_DT[,paste("subset_4~",subset_4_1_value_DT,sep="")] == subset_4_2_value_DT[i]),])
      }
    }
    dat_cut_subset_4_DT[,x_axis_names] <- factor(dat_cut_subset_4_DT[,x_axis_names],exclude=NULL)
  }
}
########################
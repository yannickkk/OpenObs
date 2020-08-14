#####Checking subset_2####
if(subset_2){
  subset_2_value <- input$subset_2
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
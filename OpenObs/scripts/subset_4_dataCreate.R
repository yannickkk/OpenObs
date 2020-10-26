#####Checking subset_4####
if(subset_4){
  subset_4_value <- input$subset_4
  
  shiny::validate(
    need(subset_4_value != "","Aucune selection pour subset_4")
  )
  
  dat_cut_subset_4<- dat_cut_subset_3
  if ("tous"%in%subset_4_value){
    dat_cut_subset_4 <- dat_cut_subset_3
  } else {
    dat_cut_subset_4 <- dat_cut_subset_3[which(dat_cut_subset_3[,subset_4_names] == subset_4_value[1]),]
    if (length(subset_4_value) > 1){
      for (i in 2:length(subset_4_value)){
        dat_cut_subset_4 <- rbind(dat_cut_subset_4,dat_cut_subset_3[which(dat_cut_subset_3[,subset_4_names] == subset_4_value[i]),])
      }
    }
    dat_cut_subset_4[,subset_4_names] <- factor(dat_cut_subset_4[,subset_4_names],exclude=NULL)
  }
  #############
} else {
  #####Multiple#####
  subset_4_2_value <- input$subset_4_2
  subset_4_1_value <- input$subset_4_1
  
  shiny::validate(
    need(subset_4_2_value != "","Aucune selection pour subset_4")
  )
  
  
  dat_cut_subset_4 <- dat_cut_subset_3
  if ("tous"%in%subset_4_2_value){
    dat_cut_subset_4 <- dat_cut_subset_3
  } else {
    dat_cut_subset_4 <- dat_cut_subset_3[which(dat_cut_subset_3[,paste("subset_4~",subset_4_1_value,sep="")] == subset_4_2_value[1]),]
    if (length(subset_4_2_value)>1){
      for (i in 2:length(subset_4_2_value)){
        dat_cut_subset_4 <- rbind(dat_cut_subset_4,dat_cut_subset_3[which(dat_cut_subset_3[,paste("subset_4~",subset_4_1_value,sep="")] == subset_4_2_value[i]),])
      }
    }
    dat_cut_subset_4[,x_axis_names] <- factor(dat_cut_subset_4[,x_axis_names],exclude=NULL)
  }
}
########################
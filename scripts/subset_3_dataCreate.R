#####Checking subset_3####
if(subset_3){
  subset_3_value <- input$subset_3
  
  shiny::validate(
    need(subset_3_value != "","Aucune selection pour subset_3")
  )
  
  
  dat_cut_subset_3<- dat_cut_subset_2
  if ("whole"%in%subset_3_value){
    dat_cut_subset_3 <- dat_cut_subset_2
  } else {
    dat_cut_subset_3 <- dat_cut_subset_2[which(dat_cut_subset_2[,subset_3_names] == subset_3_value[1]),]
    if (length(subset_3_value) > 1){
      for (i in 2:length(subset_3_value)){
        dat_cut_subset_3 <- rbind(dat_cut_subset_3,dat_cut_subset_2[which(dat_cut_subset_2[,subset_3_names] == subset_3_value[i]),])
      }
    }
    dat_cut_subset_3[,subset_3_names] <- factor(dat_cut_subset_3[,subset_3_names],exclude=NULL)
  }
  #############
} else {
  #####Multiple#####
  subset_3_2_value <- input$subset_3_2
  subset_3_1_value <- input$subset_3_1
  
  shiny::validate(
    need(subset_3_2_value != "","Aucune selection pour subset_3")
  )
  
  
  dat_cut_subset_3 <- dat_cut_subset_2
  if ("whole"%in%subset_3_2_value){
    dat_cut_subset_3 <- dat_cut_subset_2
  } else {
    dat_cut_subset_3 <- dat_cut_subset_2[which(dat_cut_subset_2[,paste("subset_3~",subset_3_1_value,sep="")] == subset_3_2_value[1]),]
    if (length(subset_3_2_value)>1){
      for (i in 2:length(subset_3_2_value)){
        dat_cut_subset_3 <- rbind(dat_cut_subset_3,dat_cut_subset_2[which(dat[,paste("subset_3~",subset_3_1_value,sep="")] == subset_3_2_value[i]),])
      }
    }
    dat_cut_subset_3[,x_axis_names] <- factor(dat_cut_subset_3[,x_axis_names],exclude=NULL)
  }
}
########################
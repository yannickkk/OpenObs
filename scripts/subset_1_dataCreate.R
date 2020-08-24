#####Checking subset_1####
if(subset_1){
  subset_1_value <- input$subset_1
  
  shiny::validate(
    need(subset_1_value != "","Aucune selection pour subset_1")
  )
  
  
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
  subset_1_1_value <- input$subset_1_1
  
  shiny::validate(
    need(subset_1_2_value != "","Aucune selection pour subset_1")
  )
  
  
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
#####Checking subset_1####
if(subset_1){
  map_subset_1_value <- input$map_subset_1
  
  shiny::validate(
    need(map_subset_1_value != "","Aucune selection pour subset_1")
  )
  
  map_dat_cut_subset_1<- dat
  if ("tous"%in%map_subset_1_value){
    map_dat_cut_subset_1 <- dat
  } else {
    map_dat_cut_subset_1 <- dat[which(dat[,subset_1_names] == map_subset_1_value[1]),]
    if (length(map_subset_1_value) > 1){
      for (i in 2:length(map_subset_1_value)){
        map_dat_cut_subset_1 <- rbind(map_dat_cut_subset_1,dat[which(dat[,subset_1_names] == map_subset_1_value[i]),])
      }
    }
    map_dat_cut_subset_1[,subset_1_names] <- factor(map_dat_cut_subset_1[,subset_1_names],exclude=NULL)
  }
  #############
} else {
  #####Multiple#####
  map_subset_1_2_value <- input$map_subset_1_2
  map_subset_1_1_value <- input$map_subset_1_1
  
  shiny::validate(
    need(map_subset_1_2_value != "","Aucune selection pour subset_1")
  )
  
  map_dat_cut_subset_1 <- dat
  if ("tous"%in%map_subset_1_2_value){
    map_dat_cut_subset_1 <- dat
  } else {
    map_dat_cut_subset_1 <- dat[which(dat[,paste("subset_1~",map_subset_1_1_value,sep="")] == map_subset_1_2_value[1]),]
    if (length(map_subset_1_2_value)>1){
      for (i in 2:length(map_subset_1_2_value)){
        map_dat_cut_subset_1 <- rbind(map_dat_cut_subset_1,dat[which(dat[,paste("subset_1~",map_subset_1_1_value,sep="")] == map_subset_1_2_value[i]),])
      }
    }
    map_dat_cut_subset_1[,x_axis_names] <- factor(map_dat_cut_subset_1[,x_axis_names],exclude=NULL)
  }
}
########################
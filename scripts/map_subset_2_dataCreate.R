#####Checking subset_2####
if(subset_2){
  map_subset_2_value <- input$map_subset_2
  
  shiny::validate(
    need(map_subset_2_value != "","Aucune selection pour subset_2")
  )
  
  map_dat_cut_subset_2<- map_dat_cut_subset_1
  if ("whole"%in%map_subset_2_value){
    map_dat_cut_subset_2 <- map_dat_cut_subset_1
  } else {
    map_dat_cut_subset_2 <- map_dat_cut_subset_1[which(map_dat_cut_subset_1[,subset_2_names] == map_subset_2_value[1]),]
    if (length(map_subset_2_value) > 1){
      for (i in 2:length(map_subset_2_value)){
        map_dat_cut_subset_2 <- rbind(map_dat_cut_subset_2,map_dat_cut_subset_1[which(map_dat_cut_subset_1[,subset_2_names] == map_subset_2_value[i]),])
      }
    }
    map_dat_cut_subset_2[,subset_2_names] <- factor(map_dat_cut_subset_2[,subset_2_names],exclude=NULL)
  }
  #############
} else {
  #####Multiple#####
  map_subset_2_2_value <- input$map_subset_2_2
  map_subset_2_1_value <- input$map_subset_2_1
  
  shiny::validate(
    need(map_subset_2_2_value != "","Aucune selection pour subset_2")
  )
  
  map_dat_cut_subset_2 <- map_dat_cut_subset_1
  if ("whole"%in%map_subset_2_2_value){
    map_dat_cut_subset_2 <- map_dat_cut_subset_1
  } else {
    map_dat_cut_subset_2 <- map_dat_cut_subset_1[which(map_dat_cut_subset_1[,paste("subset_2~",map_subset_2_1_value,sep="")] == map_subset_2_2_value[1]),]
    if (length(map_subset_2_2_value)>1){
      for (i in 2:length(map_subset_2_2_value)){
        map_dat_cut_subset_2 <- rbind(map_dat_cut_subset_2,map_dat_cut_subset_1[which(map_dat_cut_subset_1[,paste("subset_2~",map_subset_2_1_value,sep="")] == map_subset_2_2_value[i]),])
      }
    }
    map_dat_cut_subset_2[,x_axis_names] <- factor(map_dat_cut_subset_2[,x_axis_names],exclude=NULL)
  }
}
########################
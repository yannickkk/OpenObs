#####Checking subset_3####
if(subset_3){
  map_subset_3_value <- input$map_subset_3
  map_dat_cut_subset_3<- map_dat_cut_subset_2
  if ("whole"%in%map_subset_3_value){
    map_dat_cut_subset_3 <- map_dat_cut_subset_2
  } else {
    map_dat_cut_subset_3 <- map_dat_cut_subset_2[which(map_dat_cut_subset_2[,subset_3_names] == map_subset_3_value[1]),]
    if (length(map_subset_3_value) > 1){
      for (i in 2:length(map_subset_3_value)){
        map_dat_cut_subset_3 <- rbind(map_dat_cut_subset_3,map_dat_cut_subset_2[which(map_dat_cut_subset_2[,subset_3_names] == map_subset_3_value[i]),])
      }
    }
    map_dat_cut_subset_3[,subset_3_names] <- factor(map_dat_cut_subset_3[,subset_3_names],exclude=NULL)
  }
  #############
} else {
  #####Multiple#####
  map_subset_3_2_value <- input$map_subset_3_2
  map_subset_3_1_value <- input$subset_3_1
  
  
  map_dat_cut_subset_3 <- map_dat_cut_subset_2
  if ("whole"%in%map_subset_3_2_value){
    map_dat_cut_subset_3 <- map_dat_cut_subset_2
  } else {
    map_dat_cut_subset_3 <- map_dat_cut_subset_2[which(map_dat_cut_subset_2[,paste("subset_3~",map_subset_3_1_value,sep="")] == map_subset_3_2_value[1]),]
    if (length(map_subset_3_2_value)>1){
      for (i in 2:length(map_subset_3_2_value)){
        map_dat_cut_subset_3 <- rbind(map_dat_cut_subset_3,map_dat_cut_subset_2[which(map_dat_cut_subset_2[,paste("subset_3~",map_subset_3_1_value,sep="")] == map_subset_3_2_value[i]),])
      }
    }
    map_dat_cut_subset_3[,x_axis_names] <- factor(map_dat_cut_subset_3[,x_axis_names],exclude=NULL)
  }
}
########################
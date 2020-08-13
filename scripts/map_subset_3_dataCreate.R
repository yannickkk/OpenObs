#####Checking subset_3####
if(map_subset_3){
  map_subset_3_value <- input$map_subset_3
  if("whole"%in%map_subset_3_value & length(map_subset_3_value) > 1) {
    observe({
      map_dat_cut_subset_2[,subset_3_names] <- factor(map_dat_cut_subset_2[,subset_3_names])
      updateSelectInput(session,"map_subset_3",label = label3_select_1, choices = c("whole",levels(map_dat_cut_subset_2[,subset_3_names])),selected = map_subset_3_value[2])
    })
  }
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
  
  if ("whole"%in%map_subset_3_2_value & length(map_subset_3_2_value) > 1) {
    if(map_subset_3_2_value[1] == "whole") {
      observe({
        map_dat_cut_subset_2[,paste("subset_3~",map_subset_3_1_value,sep="")] <- factor(map_dat_cut_subset_2[,paste("subset_3~",map_subset_3_1_value,sep="")])
        updateSelectInput(session,"map_subset_3_2",label = paste('Select ',map_subset_3_1_value),choices = c("whole",levels(map_dat_cut_subset_2[,paste("subset_3~",map_subset_3_1_value,sep="")])),selected = map_subset_3_2_value[2])
      })
    } else {
      observe({
        map_dat_cut_subset_2[,paste("subset_3~",map_subset_3_1_value,sep="")] <- factor(map_dat_cut_subset_2[,paste("subset_3~",map_subset_3_1_value,sep="")])
        updateSelectInput(session,"map_subset_3_2",label = paste('Select ',map_subset_3_1_value),choices = c("whole",levels(map_dat_cut_subset_2[,paste("subset_3~",map_subset_3_1_value,sep="")])),selected = map_subset_3_2_value[length(map_subset_3_2_value)])
      })
    }
    
  }
  
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
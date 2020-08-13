#####Checking subset_4####
if(map_subset_4){
  map_subset_4_value <- input$map_subset_4
  if("whole"%in%map_subset_4_value & length(map_subset_4_value) > 1) {
    observe({
      map_dat_cut_subset_3[,subset_4_names] <- map_dat_cut_subset_3[,subset_4_names]
      updateSelectInput(session,"map_subset_4",label = label4_select_1, choices = c("whole",levels(map_dat_cut_subset_3[,subset_4_names])),selected = map_subset_4_value[2])
    })
  }
  map_dat_cut_subset_4<- map_dat_cut_subset_3
  if ("whole"%in%map_subset_4_value){
    map_dat_cut_subset_4 <- map_dat_cut_subset_3
  } else {
    map_dat_cut_subset_4 <- map_dat_cut_subset_3[which(map_dat_cut_subset_3[,subset_4_names] == map_subset_4_value[1]),]
    if (length(map_subset_4_value) > 1){
      for (i in 2:length(map_subset_4_value)){
        map_dat_cut_subset_4 <- rbind(map_dat_cut_subset_4,map_dat_cut_subset_3[which(map_dat_cut_subset_3[,subset_4_names] == map_subset_4_value[i]),])
      }
    }
    map_dat_cut_subset_4[,subset_4_names] <- factor(map_dat_cut_subset_4[,subset_4_names],exclude=NULL)
  }
  #############
} else {
  #####Multiple#####
  map_subset_4_2_value <- input$map_subset_4_2
  
  if ("whole"%in%map_subset_4_2_value & length(map_subset_4_2_value) > 1) {
    if(map_subset_4_2_value[1] == "whole") {
      observe({
        map_dat_cut_subset_3[,paste("subset_4~",map_subset_4_1_value,sep="")] <- factor(map_dat_cut_subset_3[,paste("subset_4~",map_subset_4_1_value,sep="")])
        updateSelectInput(session,"map_subset_4_2",label = paste('Select ',map_subset_4_1_value),choices = c("whole",levels(map_dat_cut_subset_3[,paste("subset_4~",map_subset_4_1_value,sep="")])),selected = map_subset_4_2_value[2])
      })
    } else {
      observe({
        map_dat_cut_subset_3[,paste("subset_4~",map_subset_4_1_value,sep="")] <- factor(map_dat_cut_subset_3[,paste("subset_4~",map_subset_4_1_value,sep="")])
        updateSelectInput(session,"map_subset_4_2",label = paste('Select ',map_subset_4_1_value),choices = c("whole",levels(map_dat_cut_subset_3[,paste("subset_4~",map_subset_4_1_value,sep="")])),selected = map_subset_4_2_value[length(map_subset_4_2_value)])
      })
    }
    
  }
  
  map_subset_4_1_value <- input$subset_4_1
  
  
  map_dat_cut_subset_4 <- map_dat_cut_subset_3
  if ("whole"%in%map_subset_4_2_value){
    map_dat_cut_subset_4 <- map_dat_cut_subset_3
  } else {
    map_dat_cut_subset_4 <- map_dat_cut_subset_3[which(map_dat_cut_subset_3[,paste("subset_4~",map_subset_4_1_value,sep="")] == map_subset_4_2_value[1]),]
    if (length(map_subset_4_2_value)>1){
      for (i in 2:length(map_subset_4_2_value)){
        map_dat_cut_subset_4 <- rbind(map_dat_cut_subset_4,map_dat_cut_subset_3[which(map_dat_cut_subset_3[,paste("subset_4~",map_subset_4_1_value,sep="")] == map_subset_4_2_value[i]),])
      }
    }
    map_dat_cut_subset_4[,x_axis_names] <- factor(map_dat_cut_subset_4[,x_axis_names],exclude=NULL)
  }
}
########################
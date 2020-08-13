#####Checking subset_2####
if(map_subset_2){
  map_subset_2_value <- input$map_subset_2
  if("whole"%in%map_subset_2_value & length(map_subset_2_value) > 1) {
    observe({
      map_dat_cut_subset_1[,subset_2_names] <- factor(map_dat_cut_subset_1[,subset_2_names])
      updateSelectInput(session,"map_subset_2",label = label2_select_1, choices = c("whole",levels(map_dat_cut_subset_1[,subset_2_names])),selected = map_subset_2_value[2])
    })
  }
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
  
  if ("whole"%in%map_subset_2_2_value & length(map_subset_2_2_value) > 1) {
    if(map_subset_2_2_value[1] == "whole") {
      observe({
        map_dat_cut_subset_1[,paste("subset_2~",map_subset_2_1_value,sep="")] <- factor(map_dat_cut_subset_1[,paste("subset_2~",map_subset_2_1_value,sep="")])
        updateSelectInput(session,"map_subset_2_2",label = paste('Select ',map_subset_2_1_value),choices = c("whole",levels(map_dat_cut_subset_1[,paste("subset_2~",map_subset_2_1_value,sep="")])),selected = map_subset_2_2_value[2])
      })
    } else {
      observe({
        map_dat_cut_subset_1[,paste("subset_2~",map_subset_2_1_value,sep="")] <- factor(map_dat_cut_subset_1[,paste("subset_2~",map_subset_2_1_value,sep="")])
        updateSelectInput(session,"map_subset_2_2",label = paste('Select ',map_subset_2_1_value),choices = c("whole",levels(map_dat_cut_subset_1[,paste("subset_2~",map_subset_2_1_value,sep="")])),selected = map_subset_2_2_value[length(map_subset_2_2_value)])
      })
    }
    
  }
  
  map_subset_2_1_value <- input$subset_2_1
  
  
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
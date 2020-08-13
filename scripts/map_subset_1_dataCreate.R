#####Checking subset_1####
if(map_subset_1){
  map_subset_1_value <- input$map_subset_1
  if("whole"%in%map_subset_1_value & length(map_subset_1_value) > 1) {
    observe({
      dat[,subset_1_names] <- factor(dat[,subset_1_names])
      updateSelectInput(session,"map_subset_1",label = label1_select_1, choices = c("whole",levels(dat[,subset_1_names])),selected = map_subset_1_value[2])
    })
  }
  map_dat_cut_subset_1<- dat
  if ("whole"%in%map_subset_1_value){
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
  
  if ("whole"%in%map_subset_1_2_value & length(map_subset_1_2_value) > 1) {
    if(map_subset_1_2_value[1] == "whole") {
      observe({
        dat[,paste("subset_1~",map_subset_1_1_value,sep="")] <- factor(dat[,paste("subset_1~",map_subset_1_1_value,sep="")])
        updateSelectInput(session,"map_subset_1_2",label = paste('Select ',map_subset_1_1_value),choices = c("whole",levels(dat[,paste("subset_1~",map_subset_1_1_value,sep="")])),selected = map_subset_1_2_value[2])
      })
    } else {
      observe({
        dat[,paste("subset_1~",map_subset_1_1_value,sep="")] <- factor(dat[,paste("subset_1~",map_subset_1_1_value,sep="")])
        updateSelectInput(session,"map_subset_1_2",label = paste('Select ',map_subset_1_1_value),choices = c("whole",levels(dat[,paste("subset_1~",map_subset_1_1_value,sep="")])),selected = map_subset_1_2_value[length(map_subset_1_2_value)])
      })
    }
    
  }
  
  map_subset_1_1_value <- input$subset_1_1
  
  
  map_dat_cut_subset_1 <- dat
  if ("whole"%in%map_subset_1_2_value){
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
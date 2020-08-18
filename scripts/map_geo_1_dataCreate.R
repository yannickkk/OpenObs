if(geo_1_valid){
  map_geo_1_value <- input$map_geo_1
  map_dat_cut <- map_dat_cut[which(map_dat_cut[,geo_1_names] == map_geo_1_value[1]),]
  if (length(map_geo_1_value) > 1){
    for (i in 2:length(map_geo_1_value)){
      map_dat_cut <- rbind(map_dat_cut,map_dat_cut[which(map_dat_cut[,geo_1_names] == map_geo_1_value[i]),])
    }
  }
  map_dat_cut[,geo_1_names] <- factor(map_dat_cut[,geo_1_names],exclude=NULL)
}
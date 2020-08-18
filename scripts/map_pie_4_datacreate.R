#####Checking pie_4######
map_pie_4_value <- input$map_pie_4
for (i in pie_4_names){
  if (i == paste0("pie_4~",map_pie_4_value)){
    map_df_pie_4 <- data.frame(table(map_dat_cut[,geo_2_names],map_dat_cut[,i]))
  }
}

names(map_df_pie_4) <- c("geo_2",map_pie_4_value,"Freq")

map_df_pie_4$lng <- NA
map_df_pie_4$lat <- NA
for (i in unique(cent[,"name"])){
  map_df_pie_4[which(map_df_pie_4[,c("geo_2")]==i),"lng"] <- cent[which(cent[,'name']== i),"lng"]
  map_df_pie_4[which(map_df_pie_4[,c("geo_2")]==i),"lat"] <- cent[which(cent[,'name']== i),"lat"]
}

names(map_df_pie_4) <- c("geo_2","pie_4","Freq","lng","lat")
map_df_pie_4 <- arrange(map_df_pie_4,pie_4)
map_df_pie_4$geo_2 <- as.factor(map_df_pie_4$geo_2)
name_map_df_pie_4 <- c()
for (i in levels(map_df_pie_4$geo_2)){
  name <- paste("map_df_pie_4",i,sep="_")
  df_geo_2 <- map_df_pie_4[which(map_df_pie_4[,c("geo_2")]==i), c("pie_4","Freq","geo_2","lng","lat")]
  df_geo_2 %>%
    group_by(pie_4) %>%
    mutate(Freq = sum(Freq))
  
  df_geo_2 <- df_geo_2[!duplicated(df_geo_2[,c("pie_4")]),]
  assign(name,df_geo_2)
  name_map_df_pie_4 <- c(name_map_df_pie_4,name)
}

###########################


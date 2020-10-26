#####Checking pie_1######
map_pie_1_value <- input$map_pie_1


for (i in pie_1_names){
  if (i == paste0("pie_1~",map_pie_1_value)){
    map_df_pie_1 <- data.frame(table(map_dat_cut[,geo_2_names],map_dat_cut[,i]))
  }
}

if (dim(map_df_pie_1)[1] == 0){map_df_pie_1<- data.frame(NA,NA,NA)}
names(map_df_pie_1) <- c("geo_2",map_pie_1_value,"Freq")


map_df_pie_1$lng <- NA
map_df_pie_1$lat <- NA
for (i in unique(cent[,"name"])){
  map_df_pie_1[which(map_df_pie_1[,c("geo_2")]==i),"lng"] <- cent[which(cent[,'name']== i),"lng"]
  map_df_pie_1[which(map_df_pie_1[,c("geo_2")]==i),"lat"] <- cent[which(cent[,'name']== i),"lat"]
}

names(map_df_pie_1) <- c("geo_2","pie_1","Freq","lng","lat")
map_df_pie_1 <- arrange(map_df_pie_1,pie_1)
map_df_pie_1$geo_2 <- as.factor(map_df_pie_1$geo_2)
name_map_df_pie_1 <- c()
for (i in levels(map_df_pie_1$geo_2)){
  name <- paste("map_df_pie_1",i,sep="_")
  df_geo_2 <- map_df_pie_1[which(map_df_pie_1[,c("geo_2")]==i), c("pie_1","Freq","geo_2","lng","lat")]
  df_geo_2 %>%
    group_by(pie_1) %>%
    mutate(Freq = sum(Freq))
  
  df_geo_2 <- df_geo_2[!duplicated(df_geo_2[,c("pie_1")]),]
  assign(name,df_geo_2)
  name_map_df_pie_1 <- c(name_map_df_pie_1,name)
}

###########################

 
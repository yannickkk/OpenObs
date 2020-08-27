if(!own_colors){
  if (length(levels(map_df_pie_1$pie_1)) == 1){
    pal_1 <- ("#3C7AB3")
  } else {
    pal_1 <- rainbow(length(levels(map_df_pie_1$pie_1)))
  }
}

prot_geo <- addLegend(map = prot_geo,"topleft", title = map_pie_1_value, labels = levels(map_df_pie_1$pie_1),opacity = 0.7,colors = pal_1)


for(i in name_map_df_pie_1){
  d <- get(i)
  Freq <- d %>% select(Freq)
  rownames(Freq) <- d$pie_1
  Freq <- t(Freq)
  if(pie_2_valid | pie_3_valid | pie_4_valid){
    prot_geo <- addMinicharts(map = prot_geo, lng = d$lng[1],lat = d$lat[1]+0.001, type = "pie", colorPalette = pal_1,chartdata = Freq,width = map_pie_1_width,showLabels = TRUE,opacity = 0.7,labelMinSize = 1,labelMaxSize = 32,layerId = paste(substring(i,14),map_pie_1_value,sep = " - "),popup = popupArgs(labels = levels(map_df_pie_1)),legend = FALSE)
    prot_geo <- addRectangles(prot_geo,lng1=d$lng[1],lat1 = d$lat[1],lng2=d$lng[1],lat2=d$lat[1]+0.001,weight = 1, color = "#03F", opacity = 0.2,dashArray = "dot")
    prot_geo <- addLabelOnlyMarkers(map = prot_geo, lng = d$lng[1], lat = d$lat[1], label = substring(i,14), group = "brew", labelOptions = leaflet::labelOptions(noHide = TRUE,textOnly = TRUE,opacity = 0.5))
  } else {
    prot_geo <- addMinicharts(map = prot_geo, lng = d$lng[1],lat = d$lat[1], type = "pie", colorPalette = pal_1,chartdata = Freq,width = map_pie_1_width,showLabels = TRUE,opacity = 0.7,labelMinSize = 1,labelMaxSize = 32,layerId = paste(substring(i,14),map_pie_1_value,sep = " - "),popup = popupArgs(labels = levels(map_df_pie_1)),legend = FALSE)
    
  }
}
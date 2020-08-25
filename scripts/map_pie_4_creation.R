if(!own_colors){
  if (length(levels(map_df_pie_4$pie_4)) == 1){
    pal_4 <- ("#3C7AB3")
  } else {
    pal_4 <- cm.colors(length(levels(map_df_pie_4$pie_4)))
  }
}

prot_geo <- addLegend(map = prot_geo,"bottomleft", title = map_pie_4_value, labels = levels(map_df_pie_4$pie_4),opacity = 0.7,colors = pal_4)

for(i in name_map_df_pie_4){
  d <- get(i)
  Freq <- d %>% select(Freq)
  rownames(Freq) <- d$pie_4
  Freq <- t(Freq)
  if (pie_1_valid | pie_2_valid | pie_3_valid){
    prot_geo <- addMinicharts(map = prot_geo, lng = d$lng[1]-0.001,lat = d$lat[1], type = "pie", chartdata = Freq,width = map_pie_4_width,showLabels = TRUE,opacity = 0.7,layerId = paste(substring(i,14),map_pie_4_value,sep = " - "),colorPalette = pal_4,labelMinSize = 1,labelMaxSize = 32,popup = popupArgs(labels = levels(map_df_pie_4)),legend = FALSE)
  } else {
    prot_geo <- addMinicharts(map = prot_geo, lng = d$lng[1],lat = d$lat[1], type = "pie", chartdata = Freq,width = map_pie_4_width,showLabels = TRUE,opacity = 0.7,layerId = paste(substring(i,14),map_pie_4_value,sep = " - "),colorPalette = pal_4,labelMinSize = 1,labelMaxSize = 32,popup = popupArgs(labels = levels(map_df_pie_4)),legend = FALSE)
  }
}
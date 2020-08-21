pal_3 <- topo.colors(length(levels(map_df_pie_3$pie_3)))
prot_geo <- addLegend(map = prot_geo,"bottomright", title = map_pie_3_value, labels = levels(map_df_pie_3$pie_3),opacity = 0.7,colors = pal_3)

for(i in name_map_df_pie_3){
  d <- get(i)
  Freq <- d %>% select(Freq)
  rownames(Freq) <- d$pie_3
  Freq <- t(Freq)
  if (pie_1_valid | pie_2_valid | pie_4_valid){
    prot_geo <- addMinicharts(map = prot_geo, lng = d$lng[1],lat = d$lat[1]-0.001, type = "pie", chartdata = Freq,colorPalette = pal_3,width = map_pie_3_width,showLabels = TRUE,opacity = 0.7,labelMinSize = 1,labelMaxSize = 32,layerId =  paste(substring(i,14),map_pie_3_value,sep = " - "),popup = popupArgs(labels = levels(map_df_pie_3)),legend = FALSE)
  } else {
    prot_geo <- addMinicharts(map = prot_geo, lng = d$lng[1],lat = d$lat[1], type = "pie", chartdata = Freq,colorPalette = pal_3,width = map_pie_3_width,showLabels = TRUE,opacity = 0.7,labelMinSize = 1,labelMaxSize = 32,layerId =  paste(substring(i,14),map_pie_3_value,sep = " - "),popup = popupArgs(labels = levels(map_df_pie_3)),legend = FALSE)
  }
}
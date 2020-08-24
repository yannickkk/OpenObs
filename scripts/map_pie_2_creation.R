if (length(levels(map_df_pie_2$pie_2)) == 1){
  pal_2 <- ("#3C7AB3")
} else {
  pal_2 <- terrain.colors(length(levels(map_df_pie_2$pie_2)))
}
prot_geo <- addLegend(map = prot_geo,"topright", title = map_pie_2_value, labels = levels(map_df_pie_2$pie_2),opacity = 0.7,colors = pal_2)

for(i in name_map_df_pie_2){
  d <- get(i)
  Freq <- d %>% select(Freq)
  rownames(Freq) <- d$pie_2
  Freq <- t(Freq)
  if(pie_1_valid | pie_3_valid | pie_4_valid){
    prot_geo <- addMinicharts(map = prot_geo, lng = d$lng[1]+0.001,lat = d$lat[1], type = "pie", chartdata = Freq,colorPalette = pal_2,width = map_pie_2_width,showLabels = TRUE,opacity = 0.7,labelMinSize = 1,labelMaxSize = 32,layerId = paste(substring(i,14),map_pie_2_value,sep = " - "),popup = popupArgs(labels = levels(map_df_pie_2)),legend = FALSE)
  } else {
    prot_geo <- addMinicharts(map = prot_geo, lng = d$lng[1],lat = d$lat[1], type = "pie", chartdata = Freq,colorPalette = pal_2,width = map_pie_2_width,showLabels = TRUE,opacity = 0.7,labelMinSize = 1,labelMaxSize = 32,layerId = paste(substring(i,14),map_pie_2_value,sep = " - "),popup = popupArgs(labels = levels(map_df_pie_2)),legend = FALSE)
  }
}
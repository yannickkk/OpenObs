for(i in name_map_df_pie_1){
  d <- get(i)
  Freq <- d %>% select(Freq)
  rownames(Freq) <- d$pie_1
  Freq <- t(Freq)
  prot_geo <- addMinicharts(map = prot_geo, lng = d$lng[1],lat = d$lat[1], type = "pie", chartdata = Freq,width = 75,showLabels = TRUE,opacity = 0.7,labelMinSize = 1,labelMaxSize = 32,layerId = substring(i,14),popup = popupArgs(labels = levels(map_df_pie_1)),legend = FALSE)
}
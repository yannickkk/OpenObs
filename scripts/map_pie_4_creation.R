pal_4 <- colorNumeric(c("red","green","blue"),1:length(levels(map_df_pie_4$pie_4)))
prot_geo <- addLegend(map = prot_geo,"bottomleft", title = map_pie_4_value, labels = levels(map_df_pie_4$pie_4),opacity = 0.7,colors = pal_4(1:length(levels(map_df_pie_4$pie_4))))

for(i in name_map_df_pie_4){
  d <- get(i)
  Freq <- d %>% select(Freq)
  rownames(Freq) <- d$pie_4
  Freq <- t(Freq)
  prot_geo <- addMinicharts(map = prot_geo, lng = d$lng[1],lat = d$lat[1], type = "pie", chartdata = Freq,width = 75,showLabels = TRUE,opacity = 0.7,labelMinSize = 1,labelMaxSize = 32,layerId = substring(i,14),popup = popupArgs(labels = levels(map_df_pie_4)),legend = FALSE)
}
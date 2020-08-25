if(geo_1_valid){
  updateSelectInput(session,"map_geo_1", choices = c(levels(dat[,geo_1_names])))
} else {
  removeUI(".shiny-input-container:has(#map_geo_1)",immediate = TRUE)
}

dat<-datt
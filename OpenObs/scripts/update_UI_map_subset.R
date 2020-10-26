####map_Subset_1#####

if(subset_1_valid) {
  if (!subset_1){
    observe({
      map_subset_1_1_value <- input$map_subset_1_1
      updateSelectInput(session,"map_subset_1_2",label = paste('Choisissez ',map_subset_1_1_value),choices = c("tous",levels(dat[,paste("subset_1~",map_subset_1_1_value,sep="")])),selected ="tous")
      removeUI(".shiny-input-container:has(#map_subset_1)",immediate = TRUE)
    })
  } else {
    observe({
      removeUI(selector = ".shiny-input-container:has(#map_subset_1_1)",immediate = TRUE)
      removeUI(selector = ".shiny-input-container:has(#map_subset_1_2)",immediate = TRUE)
    })
  }
} else {
  removeUI(".shiny-input-container:has(#map_subset_1)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#map_subset_1_1)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#map_subset_1_2)",immediate = TRUE)
}

#####################

#####map_Subset_2#####

if(subset_2_valid) {
  if (!subset_2){
    observe({
      map_subset_2_1_value <- input$map_subset_2_1
      updateSelectInput(session,"map_subset_2_2",label = paste('Choisissez ',map_subset_2_1_value),choices = c("tous",levels(dat[,paste("subset_2~",map_subset_2_1_value,sep="")])),selected ="tous")
      removeUI(".shiny-input-container:has(#map_subset_2)",immediate = TRUE)
    })
  } else {
    observe({
      removeUI(selector = ".shiny-input-container:has(#map_subset_2_1)",immediate = TRUE)
      removeUI(selector = ".shiny-input-container:has(#map_subset_2_2)",immediate = TRUE)
    })
  }
} else {
  removeUI(".shiny-input-container:has(#map_subset_2)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#map_subset_2_1)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#map_subset_2_2)",immediate = TRUE)
}


####map_Subset_3#####

if(subset_3_valid) {
  if (!subset_3){
    observe({
      map_subset_3_1_value <- input$map_subset_3_1
      updateSelectInput(session,"map_subset_3_2",label = paste('Choisissez ',map_subset_3_1_value),choices = c("tous",levels(dat[,paste("subset_3~",map_subset_3_1_value,sep="")])),selected ="tous")
      removeUI(".shiny-input-container:has(#map_subset_3)",immediate = TRUE)
    })
  } else {
    observe({
      removeUI(selector = ".shiny-input-container:has(#map_subset_3_1)",immediate = TRUE)
      removeUI(selector = ".shiny-input-container:has(#map_subset_3_2)",immediate = TRUE)
    })
  }
} else {
  removeUI(".shiny-input-container:has(#map_subset_3)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#map_subset_3_1)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#map_subset_3_2)",immediate = TRUE)
}

#####################

####map_Subset_4#####

if(subset_4_valid) {
  if (!subset_4){
    observe({
      map_subset_4_1_value <- input$map_subset_4_1
      updateSelectInput(session,"map_subset_4_2",label = paste('Choisissez ',map_subset_4_1_value),choices = c("tous",levels(dat[,paste("subset_4~",map_subset_4_1_value,sep="")])),selected ="tous")
      removeUI(".shiny-input-container:has(#map_subset_4)",immediate = TRUE)
    })
  } else {
    observe({
      removeUI(selector = ".shiny-input-container:has(#map_subset_4_1)",immediate = TRUE)
      removeUI(selector = ".shiny-input-container:has(#map_subset_4_2)",immediate = TRUE)
    })
  }
} else {
  removeUI(".shiny-input-container:has(#map_subset_4)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#map_subset_4_1)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#map_subset_4_2)",immediate = TRUE)
}

#####################
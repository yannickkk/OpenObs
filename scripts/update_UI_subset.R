####Subset_1#####

if(subset_1_valid) {
  if (!subset_1){
    observe({
      subset_1_1_value <- input$subset_1_1
      updateSelectInput(session,"subset_1_2",label = paste('Select ',subset_1_1_value),choices = c("whole",levels(dat[,paste("subset_1~",subset_1_1_value,sep="")])),selected ="whole")
      removeUI(".shiny-input-container:has(#subset_1)",immediate = TRUE)
    })
  } else {
    observe({
      removeUI(selector = ".shiny-input-container:has(#subset_1_1)",immediate = TRUE)
      removeUI(selector = ".shiny-input-container:has(#subset_1_2)",immediate = TRUE)
    })
  }
} else {
  removeUI(".shiny-input-container:has(#subset_1)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#subset_1_1)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#subset_1_2)",immediate = TRUE)
}

#####################

#####Subset_2#####

if(subset_2_valid) {
  if (!subset_2){
    observe({
      subset_2_1_value <- input$subset_2_1
      updateSelectInput(session,"subset_2_2",label = paste('Select ',subset_2_1_value),choices = c("whole",levels(dat[,paste("subset_2~",subset_2_1_value,sep="")])),selected ="whole")
      removeUI(".shiny-input-container:has(#subset_2)",immediate = TRUE)
    })
  } else {
    observe({
      removeUI(selector = ".shiny-input-container:has(#subset_2_1)",immediate = TRUE)
      removeUI(selector = ".shiny-input-container:has(#subset_2_2)",immediate = TRUE)
    })
  }
} else {
  removeUI(".shiny-input-container:has(#subset_2)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#subset_2_1)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#subset_2_2)",immediate = TRUE)
}


####Subset_3#####

if(subset_3_valid) {
  if (!subset_3){
    observe({
      subset_3_1_value <- input$subset_3_1
      updateSelectInput(session,"subset_3_2",label = paste('Select ',subset_3_1_value),choices = c("whole",levels(dat[,paste("subset_3~",subset_3_1_value,sep="")])),selected ="whole")
      removeUI(".shiny-input-container:has(#subset_3)",immediate = TRUE)
    })
  } else {
    observe({
      removeUI(selector = ".shiny-input-container:has(#subset_3_1)",immediate = TRUE)
      removeUI(selector = ".shiny-input-container:has(#subset_3_2)",immediate = TRUE)
    })
  }
} else {
  removeUI(".shiny-input-container:has(#subset_3)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#subset_3_1)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#subset_3_2)",immediate = TRUE)
}

#####################

####Subset_4#####

if(subset_4_valid) {
  if (!subset_4){
    observe({
      subset_4_1_value <- input$subset_4_1
      updateSelectInput(session,"subset_4_2",label = paste('Select ',subset_4_1_value),choices = c("whole",levels(dat[,paste("subset_4~",subset_4_1_value,sep="")])),selected = "whole")
      removeUI(".shiny-input-container:has(#subset_4)",immediate = TRUE)
    })
  } else {
    observe({
      removeUI(selector = ".shiny-input-container:has(#subset_4_1)",immediate = TRUE)
      removeUI(selector = ".shiny-input-container:has(#subset_4_2)",immediate = TRUE)
    })
  }
} else {
  removeUI(".shiny-input-container:has(#subset_4)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#subset_4_1)",immediate = TRUE)
  removeUI(selector = ".shiny-input-container:has(#subset_4_2)",immediate = TRUE)
}

#####################
dat<-datt
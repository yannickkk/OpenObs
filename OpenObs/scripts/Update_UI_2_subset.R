#######subset_1########
if(subset_1_valid){
  if(subset_1){
    subset_1_value <- input$subset_1
    dat_cut[,subset_1_names] <- factor(dat_cut[,subset_1_names])
    if("tous"%in%subset_1_value) {
      if (length(subset_1_value) > 1) {
        if (subset_1_value[1] == "tous"){
          observe({
            updateSelectInput(session,"subset_1",label = label1_select_1, choices = c("tous",levels(dat_cut[,subset_1_names])),selected = subset_1_value[2])
          })
        } else {
          observe({
            updateSelectInput(session,"subset_1",label = label1_select_1, choices = c("tous",levels(dat_cut[,subset_1_names])),selected = subset_1_value[-1])
          })
        }
      } else {
        observe({
          updateSelectInput(session,"subset_1",label = label1_select_1, choices = c("tous",levels(dat_cut[,subset_1_names])),selected = "tous")
        })
      }
    } 
  } else {
    subset_1_2_value <- input$subset_1_2
    subset_1_1_value <- input$subset_1_1
    
    dat_cut[,paste("subset_1~",subset_1_1_value,sep="")] <- factor(dat_cut[,paste("subset_1~",subset_1_1_value,sep="")])
    if ("tous"%in%subset_1_2_value) {
      if (length(subset_1_2_value) > 1){
        if(subset_1_2_value[1] == "tous") {
          observe({
            updateSelectInput(session,"subset_1_2",label = paste("Choisissez",subset_1_1_value),choices = c("tous",levels(dat_cut[,paste("subset_1~",subset_1_1_value,sep="")])),selected = subset_1_2_value[2])
          })
        } else {
          observe({
            updateSelectInput(session,"subset_1_2",label = paste("Choisissez",subset_1_1_value),choices = c("tous",levels(dat_cut[,paste("subset_1~",subset_1_1_value,sep="")])),selected = subset_1_2_value[length(subset_1_2_value)])
          })
        }
      } else {
        observe({
          updateSelectInput(session,"subset_1_2",label = paste("Choisissez",subset_1_1_value),choices = c("tous",levels(dat_cut[,paste("subset_1~",subset_1_1_value,sep="")])),selected = "tous")
        })
      }
    } 
  }
}

#######subset_2########
if(subset_2_valid){
  if(subset_2){
    subset_2_value <- input$subset_2
    dat_cut[,subset_2_names] <- factor(dat_cut[,subset_2_names])
    if("tous"%in%subset_2_value) {
      if (length(subset_2_value) > 1){
        if (subset_2_value[1] == "tous"){
          observe({
            updateSelectInput(session,"subset_2",label = label2_select_1, choices = c("tous",levels(dat_cut[,subset_2_names])),selected = subset_2_value[2])
          })
        } else {
          observe({
            updateSelectInput(session,"subset_2",label = label2_select_1, choices = c("tous",levels(dat_cut[,subset_2_names])),selected = subset_2_value[-1])
          })
        }
      } else {
        observe({
          updateSelectInput(session,"subset_2",label = label2_select_1, choices = c("tous",levels(dat_cut[,subset_2_names])),selected = "tous")
        })
      }
    }
  } else {
    subset_2_2_value <- input$subset_2_2
    subset_2_1_value <- input$subset_2_1
    
    dat_cut[,paste("subset_2~",subset_2_1_value,sep="")] <- factor(dat_cut[,paste("subset_2~",subset_2_1_value,sep="")])
    if ("tous"%in%subset_2_2_value) {
      if (length(subset_2_2_value) > 1) {
        if(subset_2_2_value[1] == "tous") {
          observe({
            updateSelectInput(session,"subset_2_2",label = paste("Choisissez",subset_2_1_value),choices = c("tous",levels(dat_cut[,paste("subset_2~",subset_2_1_value,sep="")])),selected = subset_2_2_value[2])
          })
        } else {
          observe({
            updateSelectInput(session,"subset_2_2",label = paste("Choisissez",subset_2_1_value),choices = c("tous",levels(dat_cut[,paste("subset_2~",subset_2_1_value,sep="")])),selected = subset_2_2_value[length(subset_2_2_value)])
          })
        }
      } else {
        observe({
          updateSelectInput(session,"subset_2_2",label = paste("Choisissez",subset_2_1_value),choices = c("tous",levels(dat_cut[,paste("subset_2~",subset_2_1_value,sep="")])),selected = "tous")
        })
      }
      
    }
  }
}

#######subset_3########
if(subset_3_valid){
  if(subset_3){
    subset_3_value <- input$subset_3
    dat_cut[,subset_3_names] <- factor(dat_cut[,subset_3_names])
    if("tous"%in%subset_3_value) {
      if(length(subset_3_value) > 1) {
        if (subset_3_value[1] == "tous"){
          observe({
            updateSelectInput(session,"subset_3",label = label3_select_1, choices = c("tous",levels(dat_cut[,subset_3_names])),selected = subset_3_value[2])
          })
        } else {
          observe({
            updateSelectInput(session,"subset_3",label = label3_select_1, choices = c("tous",levels(dat_cut[,subset_3_names])),selected = subset_3_value[-1])
          })
        }
      } else {
        observe({
          updateSelectInput(session,"subset_3",label = label3_select_1, choices = c("tous",levels(dat_cut[,subset_3_names])),selected = "tous")
        })
      }
    } 
  } else {
    subset_3_2_value <- input$subset_3_2
    subset_3_1_value <- input$subset_3_1
    
    dat_cut[,paste("subset_3~",subset_3_1_value,sep="")] <- factor(dat_cut[,paste("subset_3~",subset_3_1_value,sep="")])
    if ("tous"%in%subset_3_2_value) {
      if (length(subset_3_2_value) > 1){
        if(subset_3_2_value[1] == "tous") {
          observe({
            updateSelectInput(session,"subset_3_2",label = paste("Choisissez",subset_3_1_value),choices = c("tous",levels(dat_cut[,paste("subset_3~",subset_3_1_value,sep="")])),selected = subset_3_2_value[2])
          })
        } else {
          observe({
            updateSelectInput(session,"subset_3_2",label = paste("Choisissez",subset_3_1_value),choices = c("tous",levels(dat_cut[,paste("subset_3~",subset_3_1_value,sep="")])),selected = subset_3_2_value[length(subset_3_2_value)])
          })
        }
      } else {
        observe({
          updateSelectInput(session,"subset_3_2",label = paste("Choisissez",subset_3_1_value),choices = c("tous",levels(dat_cut[,paste("subset_3~",subset_3_1_value,sep="")])),selected = "tous")
        })
      }
    } 
  }
}

#######subset_4########
if(subset_4_valid){
  if(subset_4){
    subset_4_value <- input$subset_4
    dat_cut[,subset_4_names] <- factor(dat_cut[,subset_4_names])
    if("tous"%in%subset_4_value) {
      if (length(subset_4_value) > 1){
        if (subset_4_value[1] == "tous"){
          observe({
            updateSelectInput(session,"subset_4",label = label4_select_1, choices = c("tous",levels(dat_cut[,subset_4_names])),selected = subset_4_value[2])
          })
        } else {
          observe({
            updateSelectInput(session,"subset_4",label = label4_select_1, choices = c("tous",levels(dat_cut[,subset_4_names])),selected = subset_4_value[-1])
          })
        }
      } else {
        observe({
          updateSelectInput(session,"subset_4",label = label4_select_1, choices = c("tous",levels(dat_cut[,subset_4_names])),selected = "tous")
        })
      }
    }
  } else {
    subset_4_2_value <- input$subset_4_2
    subset_4_1_value <- input$subset_4_1
    
    dat_cut[,paste("subset_4~",subset_4_1_value,sep="")] <- factor(dat_cut[,paste("subset_4~",subset_4_1_value,sep="")])
    if ("tous"%in%subset_4_2_value) {
      if (length(subset_4_2_value) > 1){
        if(subset_4_2_value[1] == "tous") {
          observe({
            updateSelectInput(session,"subset_4_2",label = paste("Choisissez",subset_4_1_value),choices = c("tous",levels(dat_cut[,paste("subset_4~",subset_4_1_value,sep="")])),selected = subset_4_2_value[2])
          })
        } else {
          observe({
            updateSelectInput(session,"subset_4_2",label = paste("Choisissez",subset_4_1_value),choices = c("tous",levels(dat_cut[,paste("subset_4~",subset_4_1_value,sep="")])),selected = subset_4_2_value[length(subset_4_2_value)])
          })
        }
      } else {
        observe({
          updateSelectInput(session,"subset_4_2",label = paste("Choisissez",subset_4_1_value),choices = c("tous",levels(dat_cut[,paste("subset_4~",subset_4_1_value,sep="")])),selected = "tous")
        })
      }
    } 
  }
}


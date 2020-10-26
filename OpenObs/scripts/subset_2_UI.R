selectInput("subset_2",label= paste("Choisissez",label1_select_1),choices = c("tous",levels(dat[,subset_2_names])),selected = "tous",multiple=TRUE)
selectInput("subset_2_1",label = label1_select_2,choices = c(substring(subset_2_names,10)))
selectInput("subset_2_2",label = label1_select_3,choices = paste("tous",dat[,subset_2_names[1]]),multiple = TRUE,selected ="tous")
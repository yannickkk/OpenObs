#######Charger le jeu de données et renvoyer à l'UI les 10 premières lignes

dat <- reactive({
  inFile <- input$file
  
  if (is.null(inFile))
    return(NULL)
  
  read.csv2(inFile$datapath, header = input$header)
})

output$contents <- renderTable({
  head(dat(), input$n)
})


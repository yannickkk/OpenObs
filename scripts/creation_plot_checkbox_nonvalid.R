#####Checking log#####
if(input$checkboxlog){
  for (i in 1:nrow(b_an)){
    b_an[i,3] <- log(1+b_an[i,3])
    
  }
  yaxis <- list(
    title = axe_ordonnee,
    cex.axis =0.5,
    cex.lab = 0.5
  )
} else {
  yaxis <- list(
    title = axe_ordonnee,
    cex.axis =0.5,
    cex.lab = 0.5
  )
}
####################
####CrC)ation du graphique####
py_b_an <- plot_ly(type = 'bar') %>%
  layout(yaxis = yaxis, margin = m,xaxis = xaxis, barmode = "stack")
for (i in dates) {
  if (i%in%unique(annee_cut)){
    py_b_an<- add_trace(py_b_an,x = ~unique(b_an[,"especes"]),y = b_an[which(b_an[,"annee"] == i),"Freq"], name = i)
  }
}
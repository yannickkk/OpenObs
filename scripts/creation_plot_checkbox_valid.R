if (date_valid){
  jours_visite_annee<-table(substring(unique(dat_cut[,"subset_date~date"]),1,4))
} else {
  jours_visite_annee<-table(substring(unique(dat_cut[,"subset_date~date"]),7,10))
}
for (i in names(jours_visite_annee)) {
  b_an[which(as.character(b_an[,"annee"]) == i), "Freq"] <- round(b_an[which(as.character(b_an[,"annee"]) == i), "Freq"]/jours_visite_annee[i],2)
}
#####Checking log#####
if(input$checkboxlog){
  for (i in 1:nrow(b_an)) {
    b_an[i,3] <- log(1+b_an[i,3])
  }
  yaxis <- list(
    title = 'log(meat occurrences/nber of visits)',
    cex.axis =0.5,
    cex.lab = 0.5
  )
} else {
  yaxis <- list(
    title = 'meat occurrences/number of visits',
    cex.axis =0.5,
    cex.lab = 0.5
  )
}
####################
####Création du graphique####
py_b_an <- plot_ly(type = 'bar') %>%
  layout(yaxis = yaxis, margin = m,xaxis = xaxis, barmode = "stack")
for (i in dates) {
  if (i%in%unique(annee_cut)){
    py_b_an<- add_trace(py_b_an,x = ~unique(b_an[,"especes"]),y = b_an[which(b_an[,"annee"] == i),"Freq"], name = i)
  }
}
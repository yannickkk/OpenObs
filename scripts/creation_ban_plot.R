
if (date_valid){
  annee_cut<-substring(dat_cut[,"subset_date~date"],1,4)
} else {
  annee_cut<-substring(dat_cut[,"subset_date~date"],7,10)
}


b_an <- data.frame(table(tolower(dat_cut[,x_axis_names]),dat_cut$'quantity~quantite',annee_cut))
b_an$Var2 <- as.numeric(b_an$Var2)
b_an$freq <- as.numeric(b_an$Freq)
b_an$Freq <- b_an$Var2*b_an$Freq
b_an <- b_an[,-2]



shiny::validate(
  need(length(b_an) != 2, "Loading..")
)

b_an <- b_an %>%
  group_by(Var1,annee_cut) %>%
  summarise(Freq = sum(Freq))

b_an <- data.frame(b_an)
names(b_an) <- c('especes','annee','Freq')

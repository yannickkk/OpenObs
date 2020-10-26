annee_DT <- substring(dat_cut_DT[,"subset_date~date"],1,4)

b_an_DT <- data.frame(table(dat_cut_DT[,x_axis_names],dat_cut_DT$'quantity~quantite',annee_DT))
b_an_DT$Var2 <- as.numeric(b_an_DT$Var2)
b_an_DT$freq <- as.numeric(b_an_DT$Freq)
b_an_DT$Freq <- b_an_DT$Var2*b_an_DT$Freq
b_an_DT <- b_an_DT[,-2]
b_an_DT <- b_an_DT %>%
  group_by(Var1,annee_DT) %>%
  summarise(Freq = sum(Freq))

b_an_DT <- data.frame(b_an_DT)
names(b_an_DT)<-c("especes","annee","Freq")
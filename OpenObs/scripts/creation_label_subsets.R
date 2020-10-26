#####subset_1#####
if (subset_1_valid){
  label1_select_1 <<- label1_select_2#paste("Choisissez",substring(subset_1_names[1],10))
  label1_select_2 <<- label1_select_2#paste("Choisissez",label2_select_2, sep = " ")
  label1_select_3 <<- substring(subset_1_names[1],10)
} else {
  label1_select_1 <<- "1" #Label supprimé après chargement
  label1_select_2 <<- "2" #Label supprimé après chargement
  label1_select_3 <<- "3" #Label supprimé après chargement
  subset_1_names <<- 4 #supprimé après chargement
}
##################

#####subset_2#####
if (subset_2_valid){
  label2_select_1 <<- label2_select_2#paste("Choisissez",substring(subset_2_names[1],10))
  label2_select_2 <<- label2_select_2#paste("Choisissez",label2_select_2, sep = " ")
  label2_select_3 <<- substring(subset_2_names[1],10)
} else {
  label2_select_1 <<- "1" #Label supprimé après chargement
  label2_select_2 <<- "2" #Label supprimé après chargement
  label2_select_3 <<- "3" #Label supprimé après chargement
  subset_2_names <<- 4  #supprimé après chargement
}
##################

#####subset_3#####
if (subset_3_valid){
  label3_select_1 <<- label3_select_2#paste("Choisissez",substring(subset_3_names[1],10))
  label3_select_2 <<- label3_select_2#paste("Choisissez",label3_select_2, sep = " ")
  label3_select_3 <<- substring(subset_3_names[1],10)
} else {
  label3_select_1 <<- "1" #Label supprimé après chargement
  label3_select_2 <<- "2" #Label supprimé après chargement
  label3_select_3 <<- "3" #Label supprimé après chargement
  subset_3_names <<- 4 #supprimé après chargement
}
##################

#####subset_4#####
if (subset_4_valid){
  label4_select_1 <<- label4_select_2#paste("Choisissez",substring(subset_4_names[1],10))
  label4_select_2 <<- label4_select_2#paste("Choisissez",label4_select_2, sep = " ")
  label4_select_3 <<- substring(subset_4_names[1],10)
} else {
  label4_select_1 <<- "1" #Label supprimé après chargement
  label4_select_2 <<- "2" #Label supprimé après chargement
  label4_select_3 <<- "3" #Label supprimé après chargement
  subset_4_names <<- 4 #supprimé après chargement
}
##################

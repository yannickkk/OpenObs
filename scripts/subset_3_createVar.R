if (length(grep("subset_3",names(dat))) > 1){
  subset_3 <- FALSE
  subset_3_names <- names(dat[,grep("subset_3",names(dat))])
} else {
  subset_3 <- TRUE
  for (i in names(dat)){
    if (str_detect(i,"subset_3")){
      subset_3_names <- i
    }
  }
}
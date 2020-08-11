if (length(grep("subset_1",names(dat))) > 1){
  subset_1 <- FALSE
  subset_1_names <- names(dat[,grep("subset_1",names(dat))])
} else {
  subset_1 <- TRUE
  for (i in names(dat)){
    if (str_detect(i,"subset_1")){
      subset_1_names <- i
    }
  }
}
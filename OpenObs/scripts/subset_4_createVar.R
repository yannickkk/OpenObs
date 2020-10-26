if (length(grep("subset_4",names(dat))) > 1){
  subset_4 <- FALSE
  subset_4_names <- names(dat[,grep("subset_4",names(dat))])
} else {
  subset_4 <- TRUE
  for (i in names(dat)){
    if (str_detect(i,"subset_4")){
      subset_4_names <- i
    }
  }
}
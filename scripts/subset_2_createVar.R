if (length(grep("subset_2",names(dat))) > 1){
  subset_2 <- FALSE
  subset_2_names <- names(dat[,grep("subset_2",names(dat))])
} else {
  subset_2 <- TRUE
  for (i in names(dat)){
    if (str_detect(i,"subset_2")){
      subset_2_names <- i
    }
  }
}
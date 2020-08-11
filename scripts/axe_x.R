x_axis_names <- str_replace(colnames(dat)[grep("_x",names(dat))],"_x","")

if (length(x_axis_names) == 1){
  colnames(dat)[grep("_x",names(dat))] <- str_replace(colnames(dat)[grep("_x",names(dat))],"_x","")
} else {
  for (i in x_axis_names){
    if (str_detect(i,".")){
      pos <- str_locate(i,".")
      if (str_locate(i,"_x") < pos){
        x_axis_names <- i
      }
    }
  }
  colnames(dat)[grep(x_axis_names,names(dat))] <- str_replace(colnames(dat)[grep(x_axis_names,names(dat))],"_x","")
}
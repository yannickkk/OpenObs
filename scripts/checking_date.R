#####Checking date#####
dates_2 <- as.numeric(substring(input$dates,1,4))
i <- dates_2[1]
dates <- as.character(i)
i <- i+1
while (i != dates_2[2]+1) {
  dates <- c(dates,as.character(i))
  i <- i+1
}
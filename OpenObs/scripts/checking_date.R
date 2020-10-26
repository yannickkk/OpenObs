#####Checking date for plot axes#####
dates_2 <- as.numeric(substring(input$dates,1,4))
i <- dates_2[1]
dates <- as.character(i)
i <- i+1
while (i != dates_2[2]+1) {
  dates <- c(dates,as.character(i))
  i <- i+1
}

#####Checking date for filter data####
dat_cut_date[,"subset_date~date"] <- as.Date(dat_cut_date[,"subset_date~date"])
dates_value <- input$dates
dat_cut_date <- dat_cut_date %>%
  filter(dat_cut_date$'subset_date~date' > ymd(dates_value[1]) & dat_cut_date$'subset_date~date' < ymd(dates_value[2]))
###################################
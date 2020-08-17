#####Checking date for plot axes#####
dates_2_DT <- as.numeric(substring(input$dates,1,4))
i <- dates_2_DT[1]
dates_DT <- as.character(i)
i <- i+1
while (i != dates_2_DT[2]+1) {
  dates_DT <- c(dates_DT,as.character(i))
  i <- i+1
}

#####Checking date for filter data####
dat_cut_date_DT[,"subset_date~date"] <- as.Date(dat_cut_date_DT[,"subset_date~date"])
dates_value_DT <- input$dates
dat_cut_date_DT <- dat_cut_date_DT %>%
  filter(dat_cut_date_DT$'subset_date~date' > ymd(dates_value_DT[1]) & dat_cut_date_DT$'subset_date~date' < ymd(dates_value_DT[2]))
###################################
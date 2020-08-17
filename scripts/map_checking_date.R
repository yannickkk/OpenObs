#####Checking date for plot axes#####
map_dates_2 <- as.numeric(substring(input$map_dates,1,4))
i <- map_dates_2[1]
map_dates <- as.character(i)
i <- i+1
while (i != map_dates_2[2]+1) {
  map_dates <- c(map_dates,as.character(i))
  i <- i+1
}

#####Checking date for filter data####
map_dat_cut_date[,"subset_date~date"] <- as.Date(map_dat_cut_date[,"subset_date~date"])
map_dates_value <- input$map_dates
map_dat_cut_date <- map_dat_cut_date %>%
  filter(map_dat_cut_date$'subset_date~date' > ymd(map_dates_value[1]) & map_dat_cut_date$'subset_date~date' < ymd(map_dates_value[2]))
###################################
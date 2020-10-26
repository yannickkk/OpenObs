# library(shiny)
# library(shinyjs)
# library(data.table)
# 
# library(plotly)
# library(reshape)
# library(dplyr)
# library(tidyverse)
# library(tidyr)
# library(shiny)
# library(markdown)
# library(leaflet)
# library(leaflet.minicharts)
# library(units)
# library(maptools)
# library(leafsync)
# library(sodium)
# library(rdrop2)
# library(data.table)
# library(lubridate)
# library(magrittr)
# library(sf)
#####auto install packages
mypackages<-c("shiny", "shinyjs","plotly","reshape","dplyr","tidyverse","tidyr","markdown","leaflet","leaflet.minicharts","units","maptools","leafsync","sodium","rdrop2","lubridate", "magrittr", "sf","RPostgreSQL","data.table")
for (p in mypackages){
  if(!require(p, character.only = TRUE)){
    install.packages(p)
    library(p, character.only = TRUE)
  }
}

jscode <- "shinyjs.closeWindow = function() { window.close(); }"

options(shiny.maxRequestSize=300*1024^2) 


chemin_access <- "OpenObs"
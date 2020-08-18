##########variables de la page##############

titre_fenetre <- "Test"

logo <-"esi.gif"

logo_lien <- "https://www.facebook.com/esicongo"



######### Titre des onglets #################

titre_onglet1 <- "Vue des données"
titre_onglet2 <- "Spatial viewer"

######### Label subset ##############
label1_select_2 <- "subset_1" #Change to label name wanted
label2_select_2 <- "subset_2" #Change to label name wanted
label3_select_2 <- "subset_3" #Change to label name wanted
label4_select_2 <- "subset_4" #Change to label name wanted

source("scripts/creation_label_subsets.R", local = TRUE)
#############################################
######### Label pie ##############
source("scripts/creation_label_pies.R", local = TRUE)
#############################################
######### Label geo ##############
label1_geo_1 <- "Select geo_1"
label1_geo_2 <- "Select geo_2"

ui <- navbarPage(windowTitle = titre_fenetre, title=div(tags$a(img(src=logo, style="margin-top: -15px",height ="50" ,width ="179" ), href=logo_lien, target ="_blank")),
                 tabPanel(titre_onglet1,
                          ######Sidebar Layout######
                          sidebarLayout(
                            sidebarPanel(
                              #####subset_1#####
                              selectInput("subset_1",label= label1_select_1,choices = c("whole",levels(dat[,subset_1_names])),selected = "whole",multiple=TRUE),
                              selectInput("subset_1_1",label = label1_select_2,choices = c(substring(subset_1_names,10))),
                              selectInput("subset_1_2",label = label1_select_3,choices = paste("whole",dat[,subset_1_names[1]]),multiple = TRUE,selected ="whole"),
                              ##################
                              #####subset_2#####
                              selectInput("subset_2",label= label2_select_1,choices = c("whole",levels(dat[,subset_2_names])),selected = "whole",multiple=TRUE),
                              selectInput("subset_2_1",label = label2_select_2,choices = c(substring(subset_2_names,10))),
                              selectInput("subset_2_2",label = label2_select_3,choices = paste("whole",dat[,subset_2_names[1]]),multiple = TRUE,selected ="whole"),
                              ###################
                              #####subset_3#####
                              selectInput("subset_3",label= label3_select_1,choices = c("whole",levels(dat[,subset_3_names])),selected = "whole",multiple=TRUE),
                              selectInput("subset_3_1",label = label3_select_2,choices = c(substring(subset_3_names,10))),
                              selectInput("subset_3_2",label = label3_select_3,choices = paste("whole",dat[,subset_3_names[1]]),multiple = TRUE,selected ="whole"),
                              ###################
                              #####subset_4#####
                              selectInput("subset_4",label= label4_select_1,choices = c("whole",levels(dat[,subset_4_names])),selected = "whole",multiple=TRUE),
                              selectInput("subset_4_1",label = label4_select_2,choices = c(substring(subset_4_names,10))),
                              selectInput("subset_4_2",label = label4_select_3,choices = paste("whole",dat[,subset_4_names[1]]),multiple = TRUE,selected ="whole"),
                              ###################
                              checkboxInput("checkbox", label = "Display weighted data : Number of bush meat occurrences divided by number of visits", value = FALSE),
                              checkboxInput("checkboxlog", label = "Display logarithmic scale for y axis", value = FALSE),
                              dateRangeInput("dates", label = "Date range", start = paste0(date_min,"-01-01"), end = paste0(date_max,"-12-31"),min = paste0(date_min,"-01-01"),max =paste0(date_max,"-12-31"),format='yyyy',startview = "decade"),
                              actionButton("reset_input","Reset Inputs"),
                              width = 2),
                            mainPanel(
                              plotlyOutput("plotly", height = "600px"),
                              h6("missing data for occurences have been deleted"),
                              width = 10)
                            ),
                          DT::dataTableOutput("DT")
                          ),
                 tabPanel(titre_onglet2,
                          sidebarLayout(
                            sidebarPanel(
                              ############subset###############
                              #####subset_1#####
                              selectInput("map_subset_1",label= label1_select_1,choices = c("whole",levels(dat[,subset_1_names])),selected = "whole",multiple=TRUE),
                              selectInput("map_subset_1_1",label = label1_select_2,choices = c(substring(subset_1_names,10))),
                              selectInput("map_subset_1_2",label = label1_select_3,choices = paste("whole",dat[,subset_1_names[1]]),multiple = TRUE,selected ="whole"),
                              ##################
                              #####subset_2#####
                              selectInput("map_subset_2",label= label2_select_1,choices = c("whole",levels(dat[,subset_2_names])),selected = "whole",multiple=TRUE),
                              selectInput("map_subset_2_1",label = label2_select_2,choices = c(substring(subset_2_names,10))),
                              selectInput("map_subset_2_2",label = label2_select_3,choices = paste("whole",dat[,subset_2_names[1]]),multiple = TRUE,selected ="whole"),
                              ###################
                              #####subset_3#####
                              selectInput("map_subset_3",label= label3_select_1,choices = c("whole",levels(dat[,subset_3_names])),selected = "whole",multiple=TRUE),
                              selectInput("map_subset_3_1",label = label3_select_2,choices = c(substring(subset_3_names,10))),
                              selectInput("map_subset_3_2",label = label3_select_3,choices = paste("whole",dat[,subset_3_names[1]]),multiple = TRUE,selected ="whole"),
                              ###################
                              #####subset_4#####
                              selectInput("map_subset_4",label= paste("Select",label4_select_1),choices = c("whole",levels(dat[,subset_4_names])),selected = "whole",multiple=TRUE),
                              selectInput("map_subset_4_1",label = label4_select_2,choices = c(substring(subset_4_names,10))),
                              selectInput("map_subset_4_2",label = label4_select_3,choices = paste("whole",dat[,subset_4_names[1]]),multiple = TRUE,selected ="whole"),
                              ###################
                              #####Pie###########
                              selectInput("map_pie_1",label=label1_pie_1,choices = c(substring(pie_1_names,7))),
                              selectInput("map_pie_2",label=label1_pie_2,choices = c(substring(pie_2_names,7))),
                              selectInput("map_pie_3",label=label1_pie_3,choices = c(substring(pie_3_names,7))),
                              selectInput("map_pie_4",label=label1_pie_4,choices = c(substring(pie_4_names,7))),
                              ###################
                              #####Geo###########
                              selectInput("map_geo_1",label=label1_geo_1,choices = c(substring(geo_1_names,7))),
                              selectInput("map_geo_2",label=label1_geo_2,choices = c(substring(geo_2_names,7))),
                              ####################
                              dateRangeInput("map_dates", label = "Date range", start = paste0(date_min,"-01-01"), end = paste0(date_max,"-12-31"),min = paste0(date_min,"-01-01"),max =paste0(date_max,"-12-31"),format='yyyy',startview = "decade"),
                              width = 2
                            ),
                            mainPanel(leafletOutput("map",height = 850),
                                      width = 10
                                      )
                          )
                 )
)
                              
                              
                                                      
                              

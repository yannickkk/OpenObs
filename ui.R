##########variables de la page##############

titre_fenetre <- "Test"

logo <-"esi.gif"

logo_lien <- "https://www.facebook.com/esicongo"

######### Titre des onglets #################

titre_onglet1 <- "Vue des données"

######### Select dans onglet 1 ##############
source("scripts/creation_label_subsets.R")
#############################################

ui <- navbarPage(windowTitle = titre_fenetre, title=div(tags$a(img(src=logo, style="margin-top: -15px",height ="50" ,width ="179" ), href=logo_lien, target ="_blank")),
                 tabPanel(titre_onglet1,
                          ######Sidebar Layout######
                          sidebarLayout(
                            sidebarPanel(
                              #####subset_1#####
                              selectInput("subset_1",label= paste("Select",label1_select_1),choices = c("whole",levels(dat[,subset_1_names])),selected = "whole",multiple=TRUE),
                              selectInput("subset_1_1",label = label1_select_2,choices = c(substring(subset_1_names,10))),
                              selectInput("subset_1_2",label = label1_select_3,choices = paste("whole",dat[,subset_1_names[1]]),multiple = TRUE,selected ="whole"),
                              ##################
                              #####subset_2#####
                              selectInput("subset_2",label= paste("Select",label2_select_1),choices = c("whole",levels(dat[,subset_2_names])),selected = "whole",multiple=TRUE),
                              selectInput("subset_2_1",label = label2_select_2,choices = c(substring(subset_2_names,10))),
                              selectInput("subset_2_2",label = label2_select_3,choices = paste("whole",dat[,subset_2_names[1]]),multiple = TRUE,selected ="whole"),
                              ###################
                              #####subset_3#####
                              selectInput("subset_3",label= paste("Select",label3_select_1),choices = c("whole",levels(dat[,subset_3_names])),selected = "whole",multiple=TRUE),
                              selectInput("subset_3_1",label = label3_select_2,choices = c(substring(subset_3_names,10))),
                              selectInput("subset_3_2",label = label3_select_3,choices = paste("whole",dat[,subset_3_names[1]]),multiple = TRUE,selected ="whole"),
                              ###################
                              #####subset_4#####
                              selectInput("subset_4",label= paste("Select",label4_select_1),choices = c("whole",levels(dat[,subset_4_names])),selected = "whole",multiple=TRUE),
                              selectInput("subset_4_1",label = label4_select_2,choices = c(substring(subset_4_names,10))),
                              selectInput("subset_4_2",label = label4_select_3,choices = paste("whole",dat[,subset_4_names[1]]),multiple = TRUE,selected ="whole"),
                              ###################
                              checkboxInput("checkbox", label = "Display weighted data : Number of bush meat occurrences divided by number of visits", value = FALSE),
                              checkboxInput("checkboxlog", label = "Display logarithmic scale for y axis", value = FALSE),
                              dateRangeInput("dates", label = "Date range", start = paste0(date_min,"-01-01"), end = paste0(date_max,"-12-31"),min = paste0(date_min,"-01-01"),max =paste0(date_max,"-12-31"),format='yyyy',startview = "decade"),
                              width = 2),
                            mainPanel(
                              plotlyOutput("plotly", height = "600px"),
                              width = 10)
                            ),
                          DT::dataTableOutput("DT")
                          ),
                 tabPanel("Spatial viewer")
)

                              
                              
                                                      
                              

##########variables de la page##############

titre_fenetre <- "Test"

logo <-"esi.gif"

logo_lien <- "https://www.facebook.com/esicongo"

######### Titre des onglets #################

titre_onglet1 <- "Vue des données"

######### Select dans onglet 1 ##############
label1_select_1 <- substring(subset_2_names[1],10)
label1_select_2 <- "test"
label1_select_3 <- substring(subset_2_names[1],10)


ui <- navbarPage(windowTitle = titre_fenetre, title=div(tags$a(img(src=logo, style="margin-top: -15px",height ="50" ,width ="179" ), href=logo_lien, target ="_blank")),
                 tabPanel(titre_onglet1,
                          ######Sidebar Layout######
                          sidebarLayout(
                            sidebarPanel(
                              selectInput("subset_2",label= paste("Select",label1_select_1),choices = c("whole",levels(dat[,subset_2_names])),selected = "whole",multiple=TRUE),
                              selectInput("subset_2_1",label = label1_select_2,choices = c(substring(subset_2_names,10))),
                              selectInput("subset_2_2",label = label1_select_3,choices = paste("whole",dat[,subset_2_names[1]]),multiple = TRUE,selected ="whole"),
                              ###################
                              checkboxInput("checkbox", label = "Display weighted data : Number of bush meat occurrences divided by number of visits", value = FALSE),
                              checkboxInput("checkboxlog", label = "Display logarithmic scale for y axis", value = FALSE),
                              dateRangeInput("dates", label = "Date range", start = "1999-01-01", end = "2022-12-31",min = "1999-01-01",max ="2022-12-31",format='yyyy',startview = "decade"),
                              width = 2),
                            mainPanel(
                              plotlyOutput("plotly", height = "600px"),
                              width = 10
                            ),
                          ),
                 )
)
      
                              
                              
                                                      
                              

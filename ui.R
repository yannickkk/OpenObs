
###########Creation des labels###############
source("scripts/creation_label_subsets.R", local = TRUE)

source("scripts/creation_label_pies.R", local = TRUE)
#############################################


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
                              checkboxInput("checkbox", label = label_checkbox_1, value = FALSE),
                              checkboxInput("checkboxlog", label = label_checkbox_2, value = FALSE),
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
                              ####Type de carte#####
                              selectInput("map_type_carte", label = "Select basemap", choices = c("topomap" = "https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png" ,"OpenStreetMap" = "//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", "Thunderforest"= "//{s}.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png?apikey=b1aae45961fd48eeaf90a28684e31929", "ArcGIS (Satellite)" = "http://services.arcgisonline.com/arcgis/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}", "ArcGIS (World Topo)" ="http://services.arcgisonline.com/arcgis/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}" )),
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
                              checkboxInput("map_pie_1_button", label = paste("Afficher",label1_pie_1), value = FALSE),
                              selectInput("map_pie_2",label=label1_pie_2,choices = c(substring(pie_2_names,7))),
                              checkboxInput("map_pie_2_button", label =paste("Afficher",label1_pie_2), value = FALSE),
                              selectInput("map_pie_3",label=label1_pie_3,choices = c(substring(pie_3_names,7))),
                              checkboxInput("map_pie_3_button", label =paste("Afficher",label1_pie_3), value = FALSE),
                              selectInput("map_pie_4",label=label1_pie_4,choices = c(substring(pie_4_names,7))),
                              checkboxInput("map_pie_4_button", label =paste("Afficher",label1_pie_4), value = FALSE),
                              ###################
                              #####Geo###########
                              selectInput("map_geo_1",label=label1_geo_1,choices = c(substring(geo_1_names,7))),
                              ####################
                              dateRangeInput("map_dates", label = "Date range", start = paste0(date_min,"-01-01"), end = paste0(date_max,"-12-31"),min = paste0(date_min,"-01-01"),max =paste0(date_max,"-12-31"),format='yyyy',startview = "decade"),
                              actionButton("map_reset_input","Reset Inputs"),
                              width = 2
                            ),
                            mainPanel(leafletOutput("map",height = 1000),
                                      width = 10
                                      )
                          )
                      ),
                 tabPanel(titre_onglet3,
                          sidebarLayout(
                            sidebarPanel(
                              selectInput("species",label = "Species", choices = c("", levels(dat[,wikisp_names])), selected = ""),
                              htmlOutput("More informations"),
                              width = 2
                              ),
                            mainPanel(
                              htmlOutput("frame")
                            )
                          )
                        )#,
                 # tabPanel(titre_onglet4,
                 #          includeHTML(html)
                 #          )
)
                              
                              
                                                      
                              

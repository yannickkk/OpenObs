

server <- function(input, output) {
  
  dat <- reactive({
    if(input$new_param){
      if(input$data != "") {
        datapath <<- paste0(paste0(paste0(paste0("../",chemin_access),"/donnees/"),input$data), paste0("/",list.files(paste0(paste0(paste0("../",chemin_access),"/donnees/"),input$data),pattern = "data")))
        settings <<- paste0(paste0(paste0(paste0("../",chemin_access),"/donnees/"),input$data), paste0("/",list.files(paste0(paste0(paste0("../",chemin_access),"/donnees/"),input$data),pattern = "settings")))
      }
    } else {
      inFile <<- input$file
      datapath <<- inFile$datapath
    }
    
    
    
    if (is.null(datapath))
      return(NULL)
    fread(datapath, header = input$header, encoding = "UTF-8", data.table= FALSE)
    
  })
  
  
  output$contents <- renderDataTable({
    head(dat(), input$n)
    
  })
  
  observeEvent(input$submit, {

    write.csv(c("Intitulé de l'application"=input$titre_fenetre,
                "Intitulé de l'image du logo (Exemple : logo.png)"=input$logo,
                "URL renvoyé lorsqu'on clique sur le logo"=input$logo_lien,
                "Intitulé de l'onglet de visualisation des données"=input$titre_onglet1,
                "Intitulé de l'onglet de spatialisation des données"=input$titre_onglet2,
                "Intitulé de l'onglet d'informations des espèces"=input$titre_onglet3,
                "Intitulé de l'onglet du protocole"=input$titre_onglet4,
                "Intitulé du label de trie subset_1"=input$label1_select_2,
                "Intitulé du label de trie subset_2"=input$label2_select_2,
                "Intitulé du label de trie subset_3"=input$label3_select_2,
                "Intitulé du label de trie subset_4"=input$label4_select_2,
                "Intitulé du label de la checkbox_1"=input$label_checkbox_1,
                "Intitulé du label de la checkbox_2"=input$label_checkbox_2,
                "Intitulé du label de trie pie_1"=input$label1_pie_1,
                "Intitulé du label de trie pie_2"=input$label1_pie_2,
                "Intitulé du label de trie pie_3"=input$label1_pie_3,
                "Intitulé du label de trie pie_4"=input$label1_pie_4,
                "Intitulé du label de geo_1"=input$label1_geo_1,
                "Afficher les contours de la couche 1"=input$stroke_couche_1,
                "Epaisseur des contours (en pixel) couche 1"=input$weigth_couche_1,
                "Remplir l'intérieur de la couche 1"=input$fill_couche_1,
                "Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance couche 1"=input$smoothFactor_couche_1,
                "Couleur de la couche (En anglais ou code couleur html) couche 1"=input$color_couche_1,
                "Opacité du remplissage couche 1"=input$fillOpacity_couche_1,
                "Afficher les contours de la couche 2"=input$stroke_couche_2,
                "Epaisseur des contours (en pixel) couche 2"=input$weigth_couche_2,
                "Remplir l'intérieur de la couche 2"=input$fill_couche_2,
                "Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance couche 2"=input$smoothFactor_couche_2,
                "Couleur de la couche (En anglais ou code couleur html) couche 2"=input$color_couche_2,
                "Opacité du remplissage couche 2"=input$fillOpacity_couche_2,
                "Afficher les contours de la couche 3"=input$stroke_couche_3,
                "Epaisseur des contours (en pixel) couche 3"=input$weigth_couche_3,
                "Remplir l'intérieur de la couche 3"=input$fill_couche_3,
                "Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance couche 3"=input$smoothFactor_couche_3,
                "Couleur de la couche (En anglais ou code couleur html) couche 3"=input$color_couche_3,
                "Opacité du remplissage couche 3"=input$fillOpacity_couche_3,
                "Afficher les contours de la couche 4"=input$stroke_couche_4,
                "Epaisseur des contours (en pixel) couche 4"=input$weigth_couche_4,
                "Remplir l'intérieur de la couche 4"=input$fill_couche_4,
                "Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance couche 4"=input$smoothFactor_couche_4,
                "Couleur de la couche (En anglais ou code couleur html) couche 4"=input$color_couche_4,
                "Opacité du remplissage couche 4"=input$fillOpacity_couche_4,
                "Taille des camemberts de pie_1 (en pixel)"=input$pie_width_1,
                "Taille des camemberts de pie_2 (en pixel)"=input$pie_width_2,
                "Taille des camemberts de pie_3 (en pixel)"=input$pie_width_3,
                "Taille des camemberts de pie_4 (en pixel)"=input$pie_width_4,
                "Intitulé du l'axe des ordonnees"=input$axe_ordonnees,
                "Intitulé du l'axe des abscisses"=input$axe_abscisses,
                "Nom du sous-dossier contenant les fichiers de cette configuration"=input$nom_fichier,
                "Utiliser ses propres couleurs pour les camemberts"=input$own_colors,
                "Code couleur utilisé pour pie_1"=input$colors_pie_1,
                "Code couleur utilisé pour pie_2"=input$colors_pie_2,
                "Code couleur utilisé pour pie_3"=input$colors_pie_3,
                "Code couleur utilisé pour pie_4"=input$colors_pie_4
    ),
    paste0(paste0(paste0("../",chemin_access)),"/settings.csv"),row.names = TRUE)#,"/donnees" #, fileEncoding = "UTF-8")
    
      write.csv(as.data.frame(fread(inFile$datapath, header = input$header)),paste0(paste0(paste0("../",chemin_access)),"/data.csv"),row.names = FALSE)#,"/donnees" #, fileEncoding = "UTF-8")
      dir.create(paste0(paste0(paste0("../",chemin_access),"/donnees/"),input$nom_fichier))
      write.csv(as.data.frame(fread(inFile$datapath, header = input$header)),paste0(paste0(paste0(paste0("../",chemin_access),"/donnees/"),input$nom_fichier),paste0(paste0("/data_",input$nom_fichier),".csv")),row.names = FALSE)#, fileEncoding  = "UTF-8")


                  write.csv(c("Intitulé de l'application"=input$titre_fenetre,
                              "Intitulé de l'image du logo (Exemple : logo.png)"=input$logo,
                              "URL renvoyé lorsqu'on clique sur le logo"=input$logo_lien,
                              "Intitulé de l'onglet de visualisation des données"=input$titre_onglet1,
                              "Intitulé de l'onglet de spatialisation des données"=input$titre_onglet2,
                              "Intitulé de l'onglet d'informations des espèces"=input$titre_onglet3,
                              "Intitulé de l'onglet du protocole"=input$titre_onglet4,
                              "Intitulé du label de trie subset_1"=input$label1_select_2,
                              "Intitulé du label de trie subset_2"=input$label2_select_2,
                              "Intitulé du label de trie subset_3"=input$label3_select_2,
                              "Intitulé du label de trie subset_4"=input$label4_select_2,
                              "Intitulé du label de la checkbox_1"=input$label_checkbox_1,
                              "Intitulé du label de la checkbox_2"=input$label_checkbox_2,
                              "Intitulé du label de trie pie_1"=input$label1_pie_1,
                              "Intitulé du label de trie pie_2"=input$label1_pie_2,
                              "Intitulé du label de trie pie_3"=input$label1_pie_3,
                              "Intitulé du label de trie pie_4"=input$label1_pie_4,
                              "Intitulé du label de geo_1"=input$label1_geo_1,
                              "Afficher les contours de la couche 1"=input$stroke_couche_1,
                              "Epaisseur des contours (en pixel) couche 1"=input$weigth_couche_1,
                              "Remplir l'intérieur de la couche 1"=input$fill_couche_1,
                              "Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance couche 1"=input$smoothFactor_couche_1,
                              "Couleur de la couche (En anglais ou code couleur html) couche 1"=input$color_couche_1,
                              "Opacité du remplissage couche 1"=input$fillOpacity_couche_1,
                              "Afficher les contours de la couche 2"=input$stroke_couche_2,
                              "Epaisseur des contours (en pixel) couche 2"=input$weigth_couche_2,
                              "Remplir l'intérieur de la couche 2"=input$fill_couche_2,
                              "Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance couche 2"=input$smoothFactor_couche_2,
                              "Couleur de la couche (En anglais ou code couleur html) couche 2"=input$color_couche_2,
                              "Opacité du remplissage couche 2"=input$fillOpacity_couche_2,
                              "Afficher les contours de la couche 3"=input$stroke_couche_3,
                              "Epaisseur des contours (en pixel) couche 3"=input$weigth_couche_3,
                              "Remplir l'intérieur de la couche 3"=input$fill_couche_3,
                              "Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance couche 3"=input$smoothFactor_couche_3,
                              "Couleur de la couche (En anglais ou code couleur html) couche 3"=input$color_couche_3,
                              "Opacité du remplissage couche 3"=input$fillOpacity_couche_3,
                              "Afficher les contours de la couche 4"=input$stroke_couche_4,
                              "Epaisseur des contours (en pixel) couche 4"=input$weigth_couche_4,
                              "Remplir l'intérieur de la couche 4"=input$fill_couche_4,
                              "Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance couche 4"=input$smoothFactor_couche_4,
                              "Couleur de la couche (En anglais ou code couleur html) couche 4"=input$color_couche_4,
                              "Opacité du remplissage couche 4"=input$fillOpacity_couche_4,
                              "Taille des camemberts de pie_1 (en pixel)"=input$pie_width_1,
                              "Taille des camemberts de pie_2 (en pixel)"=input$pie_width_2,
                              "Taille des camemberts de pie_3 (en pixel)"=input$pie_width_3,
                              "Taille des camemberts de pie_4 (en pixel)"=input$pie_width_4,
                              "Intitulé du l'axe des ordonnees"=input$axe_ordonnees,
                              "Intitulé du l'axe des abscisses"=input$axe_abscisses,
                              "Nom du sous-dossier contenant les fichiers de cette configuration"=input$nom_fichier,
                              "Utiliser ses propres couleurs pour les camemberts"=input$own_colors,
                              "Code couleur utilisé pour pie_1"=input$colors_pie_1,
                              "Code couleur utilisé pour pie_2"=input$colors_pie_2,
                              "Code couleur utilisé pour pie_3"=input$colors_pie_3,
                              "Code couleur utilisé pour pie_4"=input$colors_pie_4
      ),
      paste0(paste0(paste0(paste0("../",chemin_access),"/donnees/"),input$nom_fichier),"/settings.csv"),row.names = TRUE)#, fileEncoding = "UTF-8")
      
    
    
    
    js$closeWindow()
    #rstudioapi::jobRunScript(path = paste0(paste0("../",chemin_access),"/scripts/runApp.R"))
    system("Rscript ..\\/openobs\\/scripts\\/runApp.R")
    stopApp()
    
  })
  
  
  observeEvent(input$submit_2, {
      write.csv(fread(settings,fill=TRUE),
                paste0(paste0(paste0("../",chemin_access)),"/settings.csv"), row.names = FALSE)#,"/donnees" #, fileEncoding = "UTF-8")
      write.csv(as.data.frame(fread(datapath, header = input$header)),paste0(paste0(paste0("../",chemin_access)),"/data.csv"),row.names = FALSE)#,"/donnees"#, fileEncoding = "UTF-8")
    
      js$closeWindow()
      #rstudioapi::jobRunScript(path = paste0(paste0("../",chemin_access),"/scripts/runApp.R"))
      system("Rscript ..\\/OpenObs\\/scripts\\/runApp.R")
      stopApp()
    })
  
}
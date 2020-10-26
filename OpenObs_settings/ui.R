ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      checkboxInput("new_param","Choisir une configuration existante"),
      conditionalPanel(condition = "input.new_param == false",
                       fileInput("file", "Choisissez un fichier csv (ou csv2)",
                                 accept = c(
                                   ".csv")
                                 
                       ),
                       numericInput("n", "Nombre de lignes du jeu de données à afficher", value = 10, min = 1, step = 1),
                       tags$hr(),
                       checkboxInput("header", "La première ligne contient les noms de colonnes", TRUE),
                       h3("Options général"),
                       textInput("nom_fichier","Nom du sous-dossier contenant les fichiers de cette configuration", value = "", width = NULL, placeholder = NULL),
                       textInput("titre_fenetre","Intitulé de l'application", value = "OpenObs", width = NULL, placeholder = NULL),
                       textInput("logo","Intitulé de l'image du logo (Exemple : logo.png)", value = "OpenObs.png", width = NULL, placeholder = NULL),
                       textInput("logo_lien","URL renvoyé lorsqu'on clique sur le logo", value = "https://github.com/yannickkk/OpenObs/wiki", width = NULL, placeholder = NULL),
                       textInput("titre_onglet1","Intitulé de l'onglet de visualisation des données", value = "Graphique des données", width = NULL, placeholder = NULL),
                       textInput("titre_onglet2","Intitulé de l'onglet de spatialisation des données", value = "Cartographie des données", width = NULL, placeholder = NULL),
                       textInput("titre_onglet3","Intitulé de l'onglet d'informations des espèces", value = "Informations sur les espèces observées", width = NULL, placeholder = NULL),
                       textInput("titre_onglet4","Intitulé de l'onglet du protocole", value = "Protocole de collecte des données", width = NULL, placeholder = NULL),
                       textInput("label1_select_2", "Intitulé du label de trie subset_1", value = "subset_1", width = NULL, placeholder = NULL),
                       textInput("label2_select_2", "Intitulé du label de trie subset_2", value = "subset_2", width = NULL, placeholder = NULL),
                       textInput("label3_select_2", "Intitulé du label de trie subset_3", value = "subset_3", width = NULL, placeholder = NULL),
                       textInput("label4_select_2", "Intitulé du label de trie subset_4", value = "subset_4", width = NULL, placeholder = NULL),
                       textInput("label_checkbox_1", "Intitulé du label de la checkbox_1", value = "Afficher les données pondérées: nombre d'individus observés divisé par le nombre d'observations", width = NULL, placeholder = NULL),
                       textInput("label_checkbox_2", "Intitulé du label de la checkbox_2", value = "Afficher l'echelle logarithmique pour l'axe des ordonnées", width = NULL, placeholder = NULL),
                       textInput("axe_ordonnees", "Intitulé du l'axe des ordonnees", value = "Nombre d'observations", width = NULL, placeholder = NULL),
                       textInput("axe_abscisses", "Intitulé du l'axe des abscisses", value = "Variable de groupement", width = NULL, placeholder = NULL),
                       textInput("label1_pie_1", "Intitulé du label de trie pie_1", value = "pie_1", width = NULL, placeholder = NULL),
                       textInput("label1_pie_2", "Intitulé du label de trie pie_2", value = "pie_2", width = NULL, placeholder = NULL),
                       textInput("label1_pie_3", "Intitulé du label de trie pie_3", value = "pie_3", width = NULL, placeholder = NULL),
                       textInput("label1_pie_4", "Intitulé du label de trie pie_4", value = "pie_4", width = NULL, placeholder = NULL),
                       textInput("label1_geo_1", "Intitulé du label de geo_1", value = "Site d'observation", width = NULL, placeholder = NULL),
                       h3("Options des différentes couches additionnelles"),
                       h4("Couche 1"),
                       checkboxInput("stroke_couche_1","Afficher les contours de la couche", value = TRUE),
                       sliderInput("weigth_couche_1","Epaisseur des contours (en pixel)", min = 0.5, max = 3, value = 1),
                       checkboxInput("fill_couche_1","Remplir l'intérieur de la couche"),
                       sliderInput("smoothFactor_couche_1","Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance",min = 0.5, max = 4, value = 2),
                       textInput("color_couche_1","Couleur de la couche (En anglais ou code couleur html)",value = "green", width = NULL, placeholder = NULL),
                       sliderInput("fillOpacity_couche_1","Opacité du remplissage",min=0,max=1,value = 0),
                       h4("Couche 2"),
                       checkboxInput("stroke_couche_2","Afficher les contours de la couche", value = TRUE),
                       sliderInput("weigth_couche_2","Epaisseur des contours (en pixel)", min = 0.5, max = 3, value = 1),
                       checkboxInput("fill_couche_2","Remplir l'intérieur de la couche"),
                       sliderInput("smoothFactor_couche_2","Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance",min = 0.5, max = 4, value = 2),
                       textInput("color_couche_2","Couleur de la couche (En anglais ou code couleur html)",value = "red", width = NULL, placeholder = NULL),
                       sliderInput("fillOpacity_couche_2","Opacité du remplissage",min=0,max=1,value = 0),
                       h4("Couche 3"),
                       checkboxInput("stroke_couche_3","Afficher les contours de la couche", value = TRUE),
                       sliderInput("weigth_couche_3","Epaisseur des contours (en pixel)", min = 0.5, max = 3, value = 1),
                       checkboxInput("fill_couche_3","Remplir l'intérieur de la couche"),
                       sliderInput("smoothFactor_couche_3","Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance",min = 0.5, max = 4, value = 2),
                       textInput("color_couche_3","Couleur de la couche (En anglais ou code couleur html)",value = "blue", width = NULL, placeholder = NULL),
                       sliderInput("fillOpacity_couche_3","Opacité du remplissage",min=0,max=1,value = 0),
                       h4("Couche 4"),
                       checkboxInput("stroke_couche_4","Afficher les contours de la couche", value = TRUE),
                       sliderInput("weigth_couche_4","Epaisseur des contours (en pixel)", min = 0.5, max = 3, value = 1),
                       checkboxInput("fill_couche_4","Remplir l'intérieur de la couche"),
                       sliderInput("smoothFactor_couche_4","Simplification des couches, plus la valeur est basse, plus la couche est précise en dépit de la performance",min = 0.5, max = 4, value = 2),
                       textInput("color_couche_4","Couleur de la couche (En anglais ou code couleur html)",value = "yellow", width = NULL, placeholder = NULL),
                       sliderInput("fillOpacity_couche_4","Opacité du remplissage",min=0,max=1,value = 0),
                       h3("Options des camemberts"),
                       sliderInput("pie_width_1","Taille des camemberts de pie_1 (en pixel)", min = 30, max = 100, value = 70),
                       sliderInput("pie_width_2","Taille des camemberts de pie_2 (en pixel)", min = 30, max = 100, value = 70),
                       sliderInput("pie_width_3","Taille des camemberts de pie_3 (en pixel)", min = 30, max = 100, value = 70),
                       sliderInput("pie_width_4","Taille des camemberts de pie_4 (en pixel)", min = 30, max = 100, value = 70),
                       checkboxInput("own_colors","Utiliser ses propres couleurs pour les camemberts"),
                       helpText("Note : Utiliser ses propres couleurs uniquement si vous êtes sur du nombre de paramètre affiché. La taille du vecteur des couleurs doit correspondre au nombre de paramètre affiché."),
                       textInput("colors_pie_1","Code couleur utilisé pour pie_1",value = "", width = NULL, placeholder = NULL),
                       helpText("Note : Utiliser seulement les codes html (https://www.code-couleur.com/). Ecrire chaque code couleur séparé par une virgule,sans espace. Exemple : #01FEDD,#448279,#000908"),
                       textInput("colors_pie_2","Code couleur utilisé pour pie_2",value = "", width = NULL, placeholder = NULL),
                       textInput("colors_pie_3","Code couleur utilisé pour pie_3",value = "", width = NULL, placeholder = NULL),
                       textInput("colors_pie_4","Code couleur utilisé pour pie_4",value = "", width = NULL, placeholder = NULL),
                       useShinyjs(),
                       extendShinyjs(text = jscode, functions = c("closeWindow")),
                       actionButton("submit","Lancer la configuration")
                       ),
      conditionalPanel(condition = "input.new_param == true",
                       selectInput("data","Choisissez la configuration que vous souhaitez utiliser", choices = (c("",list.dirs(paste0(paste0("../",chemin_access),"/donnees"), recursive = FALSE, full.names = FALSE))),selected = ""),
                       actionButton("submit_2","Lancer la configuration")
                       )
      
      
      
      
    ),
    mainPanel(
      dataTableOutput("contents")#tableOutput("contents")
    )
  )
)

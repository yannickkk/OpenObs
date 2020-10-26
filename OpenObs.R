shiny::runApp(paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/OpenObs_settings"), port = 3838, launch.browser = TRUE)

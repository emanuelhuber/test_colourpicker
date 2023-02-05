


#' test_colourpicker
#'
#' This is a shiny project
#'
#' @import graphics
#' @import shiny
#' @import colourpicker
"_PACKAGE"
#> [1] "_PACKAGE"



#' Lauch the test_colourpicker  app
#'
#' Lauch the test_colourpicker  app!
#'
#' @param ... Arguments to be passed to the function
#' @export
#'
#' @return shiny application object
runApp <- function(...) {
  shinyApp(ui = shinyAppUI, server = shinyAppServer, ...)
}




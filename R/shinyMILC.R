#' Start the MILC Shiny App
#' @export
#' @examples
#' shinyMILC()
shinyMILC <- function(){
  shiny::runApp(system.file("shiny", package = "shinyMILC"))
}


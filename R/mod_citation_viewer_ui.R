#' citation_viewer UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_citation_viewer_ui <- function(id) {
  ns <- NS(id)
  tagList(
    h3("Citations placeholder")
  )
}

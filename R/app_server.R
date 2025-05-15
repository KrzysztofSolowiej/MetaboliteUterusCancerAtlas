#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  data_path <- system.file("extdata", "small_example.rds", package = "MetaboliteUterusCancerAtlas")
  dataset <- readRDS(data_path)
  data_reactive <- reactiveVal(dataset)

  mod_data_viewer_server("viewer", data_reactive)
}

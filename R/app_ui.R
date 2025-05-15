#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    golem_add_external_resources(),
    fluidPage(
      titlePanel(title = span("Metabolite Uterus Cancer Atlas", class = "title-font")),
      tabsetPanel(
        tabPanel("Explore Data",
                 div(class = "module-panels", mod_data_viewer_ui("viewer"))
        ),
        tabPanel("Visualize Data",
                 div(class = "module-panels", mod_visualizer_ui("visualization"))),
        tabPanel("Citations",
                 div(class = "module-panels", mod_citation_viewer_ui("citations")))
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  addResourcePath(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "MetaboliteUterusCancerAtlas"
    ),
    # Custom CSS link
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  )
}


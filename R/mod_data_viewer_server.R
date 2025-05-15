#' data_viewer Server Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_data_viewer_server <- function(id, data_reactive) {
  moduleServer(id, function(input, output, session) {
    output$table <- DT::renderDataTable({
      data <- data_reactive()
      validate(need(!is.null(data), "No data available"))

      df <- as.data.frame(data)
      df$Index <- seq_len(nrow(df))
      df <- df[, c("Index", setdiff(names(df), "Index"))]

      DT::datatable(
        df,
        extensions = c("ColReorder"),
        options = list(
          scrollX = TRUE,
          scrollY = "600px",
          paging = FALSE,
          dom = "Bfrtip",
          colReorder = TRUE
        ),
        selection = "multiple",
        filter = "top",
        rownames = FALSE
      )
    })
  })
}

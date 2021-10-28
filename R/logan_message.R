#' A Logan Function
#'
#' This function allows you to express your love of cats.
#' @param Do you love cats? Defaults to TRUE.
#' @keywords none
#' @export
#' @examples
#' logan_message()



logan_message <- function(recipient = "Akika"){
  shiny::runApp({
    require(shiny)
    ui <- fluidPage(
      h2("Logan's Farewell Message Mad Lib"),
      fluidRow(column(12, h3("Provide the following to fill out the message:"))),
      fluidRow(column(3, textInput("name", "What is your name?"))),
      fluidRow(
        column(2,textInput("i_1", "1) adverb-")),
        column(2,textInput("i_2", "2) verb-")),
        column(2,textInput("i_3", "3) adjective-")),
        column(2,textInput("i_4", "4) verb (ending with ing)-")),
        column(2,textInput("i_5", "5) noun-")),
      ),
      fluidRow(
        column(2,textInput("i_6", "6) adjective-")),
        column(2,textInput("i_7", "7) adjective-")),
        column(2,textInput("i_8", "8) adjective-")),
        column(2,textInput("i_9", "9) noun (plural)-")),
        column(2,textInput("i_10", "10) noun (plural)-")),
      ),
      fluidRow(
        column(12,
               actionButton("adlib", "Fill Mad Lib"),
               actionButton("message", "Actual Message")
        )
      ),
      fluidRow(column(12,verbatimTextOutput("message")))
    )
    server <- function(input, output) {
      observeEvent(input$adlib,{
        output$message <- renderText({
          glue::glue(
            "Hi, {name}.\n
          {i_1}, I did not have many opportunities to {i_2}
          with you while we were in DCM together. Before starting
          with the team, I knew of your reputation: A very {i_3},
          hard {i_4}, {i_5} guru. What I did see of your work was
          {i_6}. You're {i_7}, {i_8}, and offer
          clever {i_9}; all ideal {i_10} for someone on a {i_5}
          team. Hopefully you make your way back to DCM and we'll
          have a chance to {i_2} together. \n
          All the best.
          Logan",
            name = input$name,
            i_1 = input$i_1, i_2 = input$i_2,i_3 = input$i_3,
            i_4 = input$i_4, i_5 = input$i_5, i_6 = input$i_6,
            i_7 = input$i_7, i_8 = input$i_8, i_9 = input$i_9,
            i_10 = input$i_10
          )
        })
      })
      observeEvent(input$message,{
        output$message <- renderText({
          glue::glue(
            "Hi, {recip}.\n
          Unfortunately, I did not have many opportunities to work
          with you while we were in DCM together. Before starting
          with the team, I knew of your reputation: A very smart,
          hard working, data guru. What I did see of your work was
          impressive. You're thorough, insightful, and offer
          clever solutions; all ideal traits for someone on a data
          team. Hopefully you make your way back to DCM and we'll
          have a chance to work together. \n
          All the best.
          Logan",
            recip = recipient)
        })
      })
    }
    shinyApp(ui = ui, server = server)
  })
}

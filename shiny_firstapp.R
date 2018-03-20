install.packages("shiny")

library(shiny)


ui = fluidPage(
  titlePanel("This is a demo"),
  sidebarLayout(
    sidebarPanel(
      textInput("txtInput","Input the text")
    ),
    mainPanel(
      paste("You are entering"),
      textOutput("txtOutput")
    )
  )
)


server <- shinyServer(function(input, output) {
  output$txtOutput =renderText({
   paste(input$txtInput) 
  })
}
)
shinyApp(ui, server)
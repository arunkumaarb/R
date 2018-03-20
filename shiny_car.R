library(shiny)


ui=fluidPage(
  titlePanel("Cars Data"),
  sidebarLayout(
    sidebarPanel(
      selectInput("Yourchoice","Select your choice",choices = names(mtcars))
    ),
    mainPanel(
      plotOutput("Cardata")
    )
  )
)



server = shinyServer(function(input, output) {
  output$Cardata = renderPlot({
    hist(mtcars[,input$Yourchoice],xlab =input$Yourchoice ) 
  })
}
)



shinyApp(ui, server)
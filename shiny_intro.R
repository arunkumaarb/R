#install.packages("shiny")
#install.packages("shinydashboard")

library(shiny)
library(shinydashboard)

ui = fluidPage(
  titlePanel("This is demo"),
  sidebarLayout(
    sidebarPanel(
      textInput("txt","Enter your text")
    ),
   mainPanel(
     paste("you are entering"),
     textOutput("txtOut")
   )
  )
)

server = shinyServer(function(input,output){
  output$txtOut = renderText({
    paste(input$txt)
    })
})

shinyApp(ui,server)
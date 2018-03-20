library(shiny)
library(shinydashboard)

shinyUI(fluidPage(
  headerPanel(title="Shiny PDF app"),
  sidebarLayout(
    sidebarPanel(
      
    ),
    mainPanel(
      tabsetPanel(type="tab",
                  tabPanel("pdf",tags$iframe(style="height:400px;width:100%;scrolling=yes",src="Resume.pdf"))
                  )
    )
  )
))


library(shiny)
library(ggplot2)

shinyServer(function(input,output){
  output$newtabs =renderUI({
    
  })
})

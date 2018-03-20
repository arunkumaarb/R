
library(shiny)
library(DT)
library(shinydashboard)

shinyUI(fluidPage(
  titlePanel("Data table-download"),
  sidebarLayout(
    sidebarPanel(
      
    ),
    mainPanel(
      DT::dataTableOutput("iris")
    )
  )
  
))


library(shiny)
library(DT)

shinyServer(function(input,output){
  #To get the output as data tables
  # output$iris =DT::renderDataTable({
  #   iris
  # })
  #To download the output in csv and pdf format, remove the {} as it is reactive function
  output$iris =DT::renderDataTable(
    iris,extensions="Buttons",options=list(dom='Bfrtip',buttons=c('copy','pdf','csv'))
  )
})
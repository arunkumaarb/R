library(shiny)
library(shinydashboard)

shinyUI(fluidPage(
  headerPanel("Upload files"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file","upload the file"),
      h5("Max file size should be 5mb"),
      radioButtons("sep","separator",choices = c(Comma=',',Period='.',Tilde='~',minus='-')),
      checkboxInput("header","Header?")
    ),
    mainPanel(
      tableOutput("input_file")
    )
  )
  
))


library(shiny)

shinyServer(function(input,output){
  output$input_file = renderTable({
    file_to_read =input$file
    if(is.null(file_to_read)){
      return()
    }
    read.table(file_to_read$datapath,sep=input$sep,header=input$header)
  })
})
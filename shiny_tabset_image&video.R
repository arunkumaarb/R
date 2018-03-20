library(shiny)
library(shinydashboard)

shinyUI(fluidPage(
  headerPanel(title="Shiny Tabset"),
  sidebarLayout(
    sidebarPanel(
      selectInput("ngear","select number of gears",c("cylinders"="cyl","Transmission"="am","Gear"="gear"))
    ),
    mainPanel(
      tabsetPanel(type="tab",
                  #To add image
                  tabPanel("Image",tags$img(src="R1.png")),
                  #To add Video
                  tabPanel("Video",tags$video(src="download.mp4",width="500px",height="350px",type="video/mp4",controls="controls")),
                  #To add youtube video get the embed link from youtube video share link
                  tabPanel("Youtube",HTML('<iframe width="560" height="315" src="https://www.youtube.com/embed/Gzy_nCkn88U" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>')),
                  tabPanel("Data",tableOutput("mtcars")),
                  tabPanel("Summary",verbatimTextOutput("summ")),
                  tabPanel("plot",plotOutput("plot"))
      )
    )
  )
))


library(shiny)
library(ggplot2)

shinyServer(function(input,output){
  output$mtcars = renderTable(
    mtcars[,c("mpg",input$ngear)]
  )
  
  output$summ = renderPrint({
    summary(mtcars[,c("mpg",input$ngear)])
  })
  
  output$plot = renderPlot({
    ggplot(mtcars,aes(x=factor(input$ngear),y=mpg))+geom_boxplot()
  })
})
library(shiny)
library(shinydashboard)
library(ggplot2)

shinyServer(function(input,output){
  
  output$histogram = renderPlot({
    #hist(faithful$eruptions)
    ggplot(faithful,aes(x=eruptions))+geom_histogram(alpha=0.8,binwidth = input$bins)
    
  })
  #This is another way of showing the message by reading a csv file
  output$msgoutput = renderMenu({
    msgs = apply(read.csv("message.csv"),1,function(row){
      messageItem(from=row[["from"]],message=row[["message"]])
    })
    dropdownMenu(type="messages",.list=msgs)
  })
  
  output$histogram1 = renderPlot({
    #hist(faithful$eruptions)
    ggplot(mtcars,aes(x=cyl))+geom_histogram(alpha=0.8,binwidth = input$bins)
    
  })
  
  output$histogram2 = renderPlot({
    #hist(faithful$eruptions)
    ggplot(mtcars,aes(x=mpg))+geom_histogram(alpha=0.8,binwidth = input$bins)
    
  })
})


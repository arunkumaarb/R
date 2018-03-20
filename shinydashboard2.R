library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(title="Shiny Dashboard",skin='red', #To show the title in the browser tab insead of ip address and add skin color
                dashboardHeader(title="This is a demo", dropdownMenuOutput("msgoutput"),
                                #To manually type the messages use this, we can use another method at server level
                                dropdownMenu(type="message",
                                             messageItem(from = "finance update",message = "we are on threshold"),
                                             messageItem(from="sales update",message="sales are at 55%")
                                ),
                                dropdownMenuOutput("notoutput"),
                                dropdownMenu(type="notification",
                                             notificationItem(text="Notification 1",icon=shiny::icon("warning"),status="warning")
                                ),
                                dropdownMenuOutput("taskoutput"),
                                dropdownMenu(type="tasks",
                                             taskItem(text="Hello",value=80,color="aqua"),
                                             taskItem(text= "shiny dashboard",value=50,color="red"))#Task and task completion %
                ),
                dashboardSidebar(
                  sidebarMenu(
                    sidebarSearchForm("searchText","buttonsearch","Search",icon=shiny::icon("search")),
                    
                    menuItem("Dashboard",tabName = "dashboard",icon=icon("dashboard")),
                    menuSubItem("Finance",tabName = "finance"),
                    menuSubItem("Sales",tabName = "sales"),
                    menuItem("Detailed Analysis",badgeLabel = "New",badgeColor = "green"),#Highlighting 
                    menuItem("Raw Data")
                    #sliderInput("bins","Select the number of breaks",0.1,1,0.8) --Moving this code inside the histogram box
                  )),
                dashboardBody(
                  tabItems(
                    tabItem(tabName="dashboard",
                            fluidRow(
                              #box(plotOutput("histogram"))
                              box(title="Histogram of faith",status = "primary",solidHeader = T, plotOutput("histogram")
                                  ,collapsible = T,
                                  br(),
                                  "Use the below slider to select the bin range",br(),br()
                                  
                                  ,box(sliderInput("bins","",0.1,1,0.8),width = 5,status="info",solidHeader = T,title="Select the number of breaks")) #To get the histogram in a collapsible box
                            ),
                            tabBox(
                              tabPanel(
                                tabPanel(title="Histogram of mpg vs cyl",status = "primary",solidHeader = T, plotOutput("histogram1")),
                                tabPanel(title="Histogram of mpg vs hp",status = "primary",solidHeader = T, plotOutput("histogram2"))
                                
                              )
                            )
                            
                    ),
                    tabItem(tabName = "finance",h1("Finance Dashboard")),
                    tabItem(tabName = "sales",h1("Sales Dashboard"))
                  ) 
                )
  )
)


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
  
  # output$histogram1 = renderPlot({
  #   #hist(faithful$eruptions)
  #   ggplot(mtcars,aes(x=cyl))+geom_histogram(alpha=0.8,binwidth = input$bins)
  #   
  # })
  # 
  # output$histogram2 = renderPlot({
  #   #hist(faithful$eruptions)
  #   ggplot(mtcars,aes(x=mpg))+geom_histogram(alpha=0.8,binwidth = input$bins)
  #   
  # })
})
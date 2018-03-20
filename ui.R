library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(
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
                    dropdownMenu(type="task",
                                 taskItem(text="Hello",value=80,color="aqua"))#Task and task completion %
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
                      ,collapsible = T,width=20,
                      br(),
                      "Use the below slider to select the bin range",br(),br()
                      
                      ,box(sliderInput("bins","",0.1,1,0.8),width = 5,status="info",solidHeader = T,title="Select the number of breaks")) #To get the histogram in a collapsible box
                ),
                tabBox(
                  tabPanel(
                    box(title="Histogram of mpg vs cyl",status = "primary",solidHeader = T, plotOutput("histogram1")),
                    box(title="Histogram of mpg vs hp",status = "primary",solidHeader = T, plotOutput("histogram2"))
                        
                  )
                )
                
                ),
        tabItem(tabName = "finance",h1("Finance Dashboard")),
        tabItem(tabName = "sales",h1("Sales Dashboard"))
      ) 
    )
  )
)
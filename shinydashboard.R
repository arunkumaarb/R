#install.packages("shiny")
#install.packages("shinydashboard")

library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(
    dashboardHeader(title="This is dashboard"),
    dashboardSidebar(
      sliderInput("bins","number of breaks",1,100,50),
      sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard"),
         menuSubItem("Dashboard Finance", tabName = "finance"),
         menuSubItem("Dashboard Sales",tabName = "sales"),
        menuItem("Detail Analysis"),
        menuItem("Raw Data")
      )
    ),
    dashboardBody(
      tabItems(
        tabItem(tabName = "dashboard",
                fluidRow(box(plotOutput("histogram")))),
        tabItem(tabName = "finance",h1("Finance Dashboard")),
        tabItem(tabName = "sales",h1("Sales Dashboard"))
      )
    )
  )
)

#shinyApp(ui,server)
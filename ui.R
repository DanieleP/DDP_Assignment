library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
    
    # Application title
    headerPanel("Big Mac Index in countries adopting EURO"),
    
    # The sidebar contains to selections for the two countries
    # in the Eurozone that we want to compare
    sidebarPanel(
        selectInput("country1", "Choose first country:", 
                    choices = c("Austria","Belgium", "Estonia",
                                "France","Germany","Greece","Ireland","Italy",
                                "Lithuania","Latvia","Netherlands",
                                "Portugal","Spain")),
        
        selectInput("country2", "Choose second country:", 
                    choices = c("Austria","Belgium", "Estonia",
                                "France","Germany","Greece","Ireland","Italy",
                                "Lithuania","Latvia","Netherlands",
                                "Portugal","Spain"))
    ),

    # mainPanel shows two charts, the first compares the two countries in terms of
    # the Purchasin Power Parity, and the second in terms of local price of a Big Mac 
    mainPanel(
        h2("Purchasing Power Parity"),     
        plotOutput("chart"),
        h2("Big Mac Local Price"),     
        plotOutput("chart2")   
    )
))

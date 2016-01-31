library(shiny)

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
    
    # C1 and C2 donwload the database of the selected countries according to
    # the user's selection
    C1 <- reactive({switch(input$country1,
               "Italy" = read.csv("ECONOMIST-BIGMAC_ITA.csv"),
               "Netherlands" = read.csv("ECONOMIST-BIGMAC_NLD.csv"),
               "Lithuania" = read.csv("ECONOMIST-BIGMAC_LTU.csv"),
               "Latvia" = read.csv("ECONOMIST-BIGMAC_LVA.csv"),
               "Estonia" = read.csv("ECONOMIST-BIGMAC_EST.csv"),
               "Spain" = read.csv("ECONOMIST-BIGMAC_ESP.csv"),
               "France" = read.csv("ECONOMIST-BIGMAC_FRA.csv"),
               "Germany" = read.csv("ECONOMIST-BIGMAC_DEU.csv"),
               "Portugal" = read.csv("ECONOMIST-BIGMAC_PRT.csv"),
               "Greece" = read.csv("ECONOMIST-BIGMAC_GRC.csv"),
               "Belgium" = read.csv("ECONOMIST-BIGMAC_BEL.csv"),
               "Poland" = read.csv("ECONOMIST-BIGMAC_POL.csv"),
               "Austria" = read.csv("ECONOMIST-BIGMAC_AUT.csv"),
               "Ireland" = read.csv("ECONOMIST-BIGMAC_IRL.csv")
               )
    })
    C2 <- reactive({switch(input$country2,
                           "Italy" = read.csv("ECONOMIST-BIGMAC_ITA.csv"),
                           "Netherlands" = read.csv("ECONOMIST-BIGMAC_NLD.csv"),
                           "Lithuania" = read.csv("ECONOMIST-BIGMAC_LTU.csv"),
                           "Latvia" = read.csv("ECONOMIST-BIGMAC_LVA.csv"),
                           "Estonia" = read.csv("ECONOMIST-BIGMAC_EST.csv"),
                           "Spain" = read.csv("ECONOMIST-BIGMAC_ESP.csv"),
                           "France" = read.csv("ECONOMIST-BIGMAC_FRA.csv"),
                           "Germany" = read.csv("ECONOMIST-BIGMAC_DEU.csv"),
                           "Portugal" = read.csv("ECONOMIST-BIGMAC_PRT.csv"),
                           "Greece" = read.csv("ECONOMIST-BIGMAC_GRC.csv"),
                           "Belgium" = read.csv("ECONOMIST-BIGMAC_BEL.csv"),
                           "Poland" = read.csv("ECONOMIST-BIGMAC_POL.csv"),
                           "Austria" = read.csv("ECONOMIST-BIGMAC_AUT.csv"),
                           "Ireland" = read.csv("ECONOMIST-BIGMAC_IRL.csv")
    )
    })    
    
    # First chart compares PPP of both countries
    output$chart <- renderPlot({  
        country1 <- C1()
        country2 <- C2()
        labels <- c(input$country1, input$country2)
        ## Define the chart's ranges
        low1 <- min(country1$dollar_ppp)
        low2 <- min(country2$dollar_ppp)
        low <- min(low1,low2)
        High1 <- max(country1$dollar_ppp)
        High2 <- max(country2$dollar_ppp)
        High <- max(High1,High2)
        
        early1 <- min(as.Date(country1$Date))
        early2 <- min(as.Date(country2$Date))
        early <- min(early1,early2)
        late1 <- max(as.Date(country1$Date))
        late2 <- max(as.Date(country2$Date))
        late <- max(late1,late2)
        
        # Draw the plot
        plot(as.Date(country1$Date),country1$dollar_ppp, type = "l", 
             xlab = "Year", ylab = "Purchasing Power Parity", col="blue", 
             xlim=c(early,late),ylim=c(low,High))
        lines(as.Date(country2$Date),country2$dollar_ppp, col="red")
        legend("topright", labels, lty= c(1,1),col=c("blue","red"))
        
        })
    
    # Chart 2 compares the Big Mac local price in the two countries
    output$chart2 <- renderPlot({  
        country1 <- C1()
        country2 <- C2()
        labels <- c(input$country1, input$country2)
        ## Define the chart's ranges
        low1 <- min(country1$local_price)
        low2 <- min(country2$local_price)
        low <- min(low1,low2)
        High1 <- max(country1$local_price)
        High2 <- max(country2$local_price)
        High <- max(High1,High2)
        
        early1 <- min(as.Date(country1$Date))
        early2 <- min(as.Date(country2$Date))
        early <- min(early1,early2)
        late1 <- max(as.Date(country1$Date))
        late2 <- max(as.Date(country2$Date))
        late <- max(late1,late2)
        
        # Draw the plot
        plot(as.Date(country1$Date),country1$local_price, type = "l", 
             xlab = "Year", ylab = "Local price", col="blue", 
             xlim=c(early,late),ylim=c(low,High))
        lines(as.Date(country2$Date),country2$local_price, col="red")
        legend("topright", labels, lty= c(1,1),col=c("blue","red"))
        
    })
})


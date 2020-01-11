shinyServer(
    function(input, output) {
        
        output$line <- renderPlotly({
            p1 <- crime %>%
                filter(State == input$State) %>%
                ggplot(aes(x = Year, y = Total_Incidents_Reported)) +
                geom_line() +
                labs(title = paste('Hate Crimes in US,', input$State),
                     y = "Total Hate Crimes",
                     x = "Year")
            ggplotly(p1)
        })
        
        output$table <- renderDataTable({
            datatable(crime %>%
                          filter(State == input$State) %>%
                          mutate(`Year Rank` = rank(-Year, ties.method = 'min'),
                                 `Crime Rank` = rank(-Total_Incidents_Reported, ties.method = 'min')) %>%
                          select(State,
                                 Year,
                                 Total_Incidents_Reported
                          ) %>%
                          arrange(desc(Total_Incidents_Reported)),
                      rownames = FALSE)
        })
        
        output$scatter <- renderPlotly({
            p2 <- factors %>%
                # select(input$factors_choice %>%
                ggplot(aes_string(x = input$factors_choice, y = 'avg_hatecrimes_per_100k_fbi')) +
                geom_point() + geom_smooth()+
                labs(title = paste('Hate Crimes by State vs', new_choices[input$factors_choice]),
                     y = "Average Hate Crimes Per 100K FBI",
                     x = new_choices[input$factors_choice])
            ggplotly(p2)})
        
        
        
    })

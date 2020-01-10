shinyServer(
    function(input, output) {

        output$line <- renderPlotly({
            p <- crime %>%
                filter(State == input$State) %>%
                ggplot(aes(x = Year, y = Total_Incidents_Reported)) +
                geom_line() +
                labs(title = paste('Hate Crimes in US,', input$State),
                     y = "Total Hate Crimes",
                     x = "Year")
            ggplotly(p)
        })

        output$table <- renderDataTable({
            datatable(crime_state %>%
                          filter(State == input$State) %>%
                          mutate(`Year Rank` = rank(-Year, ties.method = 'min'),
                                 `Crime Rank` = rank(-Total_Incidents_Reported, ties.method = 'min')) %>%
                          select(State,
                                 Year,
                                 Total_Incidents_Reported
                                 ) %>%
                          arrange(desc(Total_Incidents_Reported)),
                      rownames = FALSE
            )

        })
    })

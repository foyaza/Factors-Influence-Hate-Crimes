shinyUI(
    dashboardPage(
        skin = "purple",
        header = dashboardHeader(title = 'Hate Crimes in US'),
        
        sidebar = dashboardSidebar(
            sidebarMenu(
                menuItem("Overview", tabName = "Overview", icon = icon("eye")),
                menuItem("Trends", tabName = "Trends", icon = icon("poll")),
                menuItem("Key Factors", tabName = "Key_Factors", icon = icon("list-alt"))
            )
        ),
        
        body = dashboardBody(
            tabItems(
                tabItem(tabName = "Overview",
                        h2("Hate Crimes in The US"),
                        h4("This App allows users to look at the trends on Hate Crimes in the US from the year 2009 to 2018
                           and also shows a snapshot of hate crimes from a dataset from 2016 and visualizes the relashionship
                           among hate crimes and other key factors")
                ),
                
                tabItem(tabName = "Trends",
                        selectInput("State", label = "State:", choices = States,
                                    selected = 'Total'),
                        "Data Source:" ,
                        div(a(href = "https://ucr.fbi.gov/hate-crime", img(src="fbi.jpeg", width = 100), target = "_blank")),
                        fluidRow(
                            br(),
                            plotlyOutput("line", width = 800)),
                        fluidRow(
                            box(width = 12, status = 'primary',
                                'Click on column name to sort.',
                                dataTableOutput("table")))
                ),
                
                
                tabItem(tabName = "Key_Factors",
                        
                        selectInput("factors_choice", label = "Factors", choices = choices,
                                    selected = 'Median Household Income'),
                        "Data Source:" ,
                        div(a(href = "https://data.fivethirtyeight.com/", img(src="five.png", width = 100), target = "_blank")),
                        fluidRow(
                            br(),
                            plotlyOutput("scatter", width = 800))
                        
                )))))


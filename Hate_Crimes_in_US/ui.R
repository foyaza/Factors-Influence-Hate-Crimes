shinyUI(
    dashboardPage(
        dashboardHeader(title = 'Hate Crimes in US'),
        dashboardSidebar(
            selectInput("State", label = "State:", choices = States,
                        selected = 'Total'),
            "Data Source:" ,
            div(a(href = "https://ucr.fbi.gov/hate-crime", img(src="fbi.jpeg", width = 100), target = "_blank"))
        ),
        dashboardBody(
            fluidRow(
                plotlyOutput("line", width = 800)
            ),
            fluidRow(
                box(width = 12, status = 'primary',
                    'Click on column name to sort.',
                    dataTableOutput("table"))
            )
        )
    )
)

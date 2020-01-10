library(shinydashboard)
library(tidyverse)
library(DT)
library(plotly)

crime <- readRDS('data/crime_state.RDS')

# Generate Options for dropdown menu in ui
States <- crime %>% 
  pull(State) %>% 
  unique()
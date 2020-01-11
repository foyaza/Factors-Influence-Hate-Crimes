library(shinydashboard)
library(tidyverse)
library(DT)
library(plotly)

#Reading Datasets
crime <- readRDS('data/crime_state.RDS')
factors <- readRDS('data/key_factors.RDS')

# Generate Options for dropdown menu in ui
States <- crime %>% 
  pull(State) %>% 
  unique()


choices <-  c("Median Household Income" = 'median_household_income',
              'Share Unemployed Seasonal' = 'share_unemployed_seasonal',
              'Share Population in Metro Area' = 'share_population_in_metro_areas',
              'Share Population with High School Degree' = 'share_population_with_high_school_degree',
              'Share non Citizen' = 'share_non_citizen',
              'Share White Poverty' = 'share_white_poverty',
              'Gini Index' = 'gini_index',
              'Share non White' = 'share_non_white',
              'Share Voters Voted Trump' = 'share_voters_voted_trump')

new_choices <- c(names(choices))
names(new_choices) <- choices

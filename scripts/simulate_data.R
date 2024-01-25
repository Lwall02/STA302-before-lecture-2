#### Preamble ####
# Purpose: Simulate a data set similar to what I would find in my research topic
# Author: Liam Wall
# Date: 23 January 2024
# Contact: liam.wall@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)
library(dplyr)


### Simulate Data ###
set.seed(108)

# Simulate library with 10 library branches each year
simulated_library <- 
  tibble(
    Year = rep(2013:2022, each = 10),
    Branch_ID = rep(1:10, each = 10),
    Visits = runif(100, 80000, 160000),
    Registrations = runif(100, 500, 2000),
    Circulations = runif(100, 200000, 300000),
    Sessions = runif(100, 20000, 60000)
  )

# summary statistics of the simulated data
summarized_library <- simulated_library |>
  summarise(
    mean_visits = mean(Visits),
    mean_regis = mean(Registrations),
    mean_circ = mean(Circulations),
    mean_sessions = mean(Sessions),
    .by = Year
  )

# graph of simulated data
graph_library <- summarized_library |>
  ggplot(aes(x = Year, y = mean_visits)) + 
  geom_point()

scatter_library <- summarized_library |>
  ggplot(aes(x = Year, y = mean_visits)) + 
  geom_point(alpha = 0.3)

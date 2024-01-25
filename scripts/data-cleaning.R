#### Preamble ####
# Purpose: Clean the raw library data. I will combine each of the four test statistics in to one tibble.
# Author: Liam Wall
# Date: 23 January 2024
# Contact: liam.wall@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
raw_visits <- read_csv("inputs/data/tpl-visits-annual-by-branch-2012-2022.csv")

raw_general_info <-read_csv("inputs/data/tpl-branch-general-information-2023.csv")
raw_registrations <- read_csv("inputs/data/tpl-card-registrations-annual-by-branch-2012-2022.csv")
raw_computerusage_2012_2017 <- read_csv("inputs/data/tpl-workstation-usage-annual-by-branch-2012-2017.csv")
raw_computerusage_2018_2022 <- read_csv("inputs/data/tpl-workstation-usage-annual-by-branch-2018-2022.csv")
raw_circulation <- read_csv("inputs/data/tpl-circulation-annual-by-branch-2012-2022.csv")

raw_vis_regis <- left_join(x = raw_visits, y = raw_registrations, by = 
                             join_by(BranchCode == BranchCode, Year == Year))
raw_vis_regis_circ <- left_join(x = raw_vis_regis, y = raw_circulation, by = 
                                 join_by(BranchCode == BranchCode, Year == Year))
raw_computer_usage <- full_join(raw_computerusage_2012_2017, raw_computerusage_2018_2022)
raw_data <- left_join(x = raw_vis_regis_circ, y = raw_computer_usage, by = 
                        join_by(BranchCode == BranchCode, Year == Year))

clean_data <- clean_names(raw_data) |>
  select(year, branch_code, visits, registrations, circulation, sessions)

clean_data_1 <- clean_data |>
  arrange(branch_code) |>
  slice(-(133:143))

clean_data_2 <- clean_data_1 |>
  arrange(branch_code) |>
  slice(-(656:666))

clean_data_3 <- clean_data_2 |>
  arrange(branch_code) |>
  slice(-(731:741))

clean_data_4 <- clean_data_3 |>
  arrange(branch_code) |>
  slice(-(885:895))

clean_data <- clean_data_4

#### Save data ####
write_csv(clean_data, "outputs/data/cleaned_combined_data.csv")

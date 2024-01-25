#### Preamble ####
# Purpose: Download the raw data from Open Data Toronto for this report
# Author: Liam Wall
# Date: 23 January 2024
# Contact: liam.wall@mail.utoronto.ca

### Download Data ###

# The CSV files listed below were uploaded in Posit Cloud after being downloaded through Open Data Toronto
# This is mentioned in the final report

raw_visits <- read_csv("inputs/data/tpl-visits-annual-by-branch-2012-2022.csv")
raw_general_info <-read_csv("inputs/data/tpl-branch-general-information-2023.csv")
raw_registrations <- read_csv("inputs/data/tpl-card-registrations-annual-by-branch-2012-2022.csv")
raw_computerusage_2012_2017 <- read_csv("inputs/data/tpl-workstation-usage-annual-by-branch-2012-2017.csv")
raw_computerusage_2018_2022 <- read_csv("inputs/data/tpl-workstation-usage-annual-by-branch-2018-2022.csv")
raw_circulation <- read_csv("inputs/data/tpl-circulation-annual-by-branch-2012-2022.csv")

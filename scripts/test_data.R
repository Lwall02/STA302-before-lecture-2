#### Preamble ####
# Purpose: Test the data I cleaned in data_cleaning.R
# Author: Liam Wall
# Date: 23 January 2024
# Contact: liam.wall@mail.utoronto.ca


#### Workspace setup ####
library(tidyverse)
library(testthat) # inside tidyverse

# Use the clean data already downloaded in \project\outputs\data\cleaned_combined_data.csv
clean_data 

test_that("All expected columns are there", {
  expect_true("year" %in% colnames(clean_data))
  expect_true("branch_code" %in% colnames(clean_data))
  expect_true("visits" %in% colnames(clean_data))
  expect_true("registrations" %in% colnames(clean_data))
  expect_true("circulation" %in% colnames(clean_data))
  expect_true("sessions" %in% colnames(clean_data))
})


test_that("No NAs where there shouldn't be any", {
  expect_equal(sum(is.na(clean_data$visits)), 0)
  expect_equal(sum(is.na(clean_data$registrations)), 0)
  expect_equal(sum(is.na(clean_data$circulation)), 0)
})

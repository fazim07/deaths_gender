#### Preamble ####
# Purpose: Simulates data regarding gender and age based death tolls within the Homeless population in Toronto
# Author: Faiza Imam
# Date: April 17th 2024
# Contact: faiza.imam@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(tibble)


#Code Ref:https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html
#Code error check done by ChatGPT --> Receipts in usage.txt

# Define the genders vector
genders <- c("Male", "Female")

# Simulate data using tibble
simulated_data <- tibble(
  # for years 2017-2023 and for each month
  Year_Death = rep(c(2017:2023), each = 12),
  # run death toll
  Death_Toll = runif(84, min = 0, max = 200),
  Age_group = runif(84, min = 18, max = 70),
  Gender = sample(genders, 84, replace = TRUE)
)

# Print the simulated data
print(simulated_data)

#### Preamble ####
# Purpose: Test the cleaned dtasets to ensure validity of the values and to check for any issues 
# Author: Faiza Imam
# Date: April 19th 2024
# Contact: faiza.imam@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R, 02-data_cleaning.R


#### Workspace setup ####
library(tidyverse) 

## Test if there are 7 years
clean_omitNA$Year_of_death |> min(na.rm = TRUE) >= 7

## Test if the lowest death toll
clean_omitNA$death_toll|> min() == 1

## Test highest death toll
clean_omitNA$death_toll|> max() == 51

#Chatgpt helped fix error --> usage.txt has the receipt
# Convert Age_group to character and test for lowest age range
is_lowest_age_range <- min(as.character(clean_omitNA$Age_group)) == "<20"

#Check for highest age range
is_highest_age_range <- max(as.character(clean_omitNA$Age_group)) == "60+"


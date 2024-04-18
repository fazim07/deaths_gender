#### Preamble ####
# Purpose: Clean and Save data sets and mini sets for paper projection
# Author: Faiza Imam
# Date: April 17th 2024
# Contact: faiza.imam@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(tidyverse)
library(janitor)
library(dplyr)
library(readr)

#### Clean data ####
data_clean <- readr::read_csv("raw_data.csv")

data_clean

#Change column name from count to death toll to avoid confusion with count function
#Code reference: https://www.geeksforgeeks.org/change-column-name-of-a-given-dataframe-in-r/
colnames(data_clean)[which(colnames(data_clean) == "Year of death")] <- "Year_of_death"
colnames(data_clean)[which(colnames(data_clean) == "Count")] <- "death_toll"

#Selecting only the three columns needed for paper ; year, cause, age, Gender and death toll count
#Cite code: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html
data_clean <-
  data_clean |>
  select(
    Year_of_death,
    Cause_of_death,
    Gender,
    Age_group,
    death_toll
  ) 

#Save the clean data file
write_csv(
  x = data_clean,
  file = "clean_data.csv"
)


## Cleanup within data set ##
clean_omitNA <- data_clean[!data_clean$`Age_group` %in% c("Unknown"),]


#Save the clean data file
write_csv(
  x = clean_omitNA,
  file = "clean_data_NA.csv"
)


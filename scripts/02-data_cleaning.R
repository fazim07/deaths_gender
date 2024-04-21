#### Preamble ####
# Purpose: Clean the data set and save files according to resources needed for paper
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
library (arrow)
#install_arrow()

#### Clean data ####
data_clean <- readr::read_csv("data/raw_data/raw_data.csv")

data_clean


#Code reference: https://www.geeksforgeeks.org/change-column-name-of-a-given-dataframe-in-r/

colnames(data_clean)[which(colnames(data_clean) == "Year of death")] <- "Year_of_death"
#Change column names from count to death toll and year of death to year-of_death for better practice
colnames(data_clean)[which(colnames(data_clean) == "Count")] <- "death_toll"

#Selecting only the four columns needed for paper ; year, cause, age, Gender and death toll count
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
write_csv(data_clean, "data/analysis_data/clean_data.csv")


## Cleanup within data set ##
clean_omitNA <- data_clean[!data_clean$`Age_group` %in% c("Unknown"),]


#Save the clean data file
write_csv(clean_omitNA, "data/analysis_data/clean_dataNA.csv")


clean_omitNA <-
  clean_omitNA |>
  select(
    Year_of_death,
    Gender,
    Age,
    death_toll
  ) 


#Following few lines of code are from  https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html
#Total Cause of death by year
YearvDeath <- clean_omitNA %>%
group_by(Year_of_death) %>%
  summarize(total_deaths = sum(death_toll))
YearvDeath

#Common cause of death and their tolls
causevDeath <- clean_omitNA %>%
  group_by(Cause_of_death) %>%
  summarize(total_deaths = sum(death_toll))
causevDeath

#Gender Death Tolls
GendervDeath <- clean_omitNA %>%
  group_by(Gender) %>%
  summarize(total_deaths = sum(death_toll))
GendervDeath

#Death tolls y year and gender
GendervYear <- clean_omitNA %>%
  group_by(Year_of_death, Gender) %>%
  summarize(total_deaths = sum(death_toll))
GendervYear

#Gender and cuases of death within each group
GendervCause <- clean_omitNA %>%
  group_by(Cause_of_death, Gender) %>%
  summarize(total_deaths = sum(death_toll))
GendervCause

#Yearly death causes
YearvCause <- clean_omitNA %>%
  group_by(Year_of_death, Cause_of_death) %>%
  summarize(total_deaths = sum(death_toll))
YearvCause

# Define the order of age groups
age_order <- c("<20", "20-39", "40-59", "60+")

# Use factor to set the order of levels for Age_group
clean_omitNA$Age_group <- factor(clean_omitNA$Age_group, levels = age_order)

# Group by Cause_of_death and Age_group, maintaining the age order
AgevCause <- clean_omitNA %>%
  group_by(Cause_of_death, Age_group) %>%
  summarize(total_deaths = sum(death_toll))
AgevCause

#Age and gender death count
AgevGender <- clean_omitNA %>%
  group_by(Gender, Age_group) %>%
  summarize(total_deaths = sum(death_toll))
AgevGender

#Age group death count
AgevDeath <- clean_omitNA %>%
  group_by(Age_group) %>%
  summarize(total_deaths = sum(death_toll))
AgevDeath

#Write parquet files
write_parquet(clean_omitNA, "data/analysis_data/clean_omitNA.parquet")

#### Preamble ####
# Purpose: Download and save the data from Opendata Toronto public data set, speficailly the Homeless_death_by_cause data set years 2017-2023
# Author: Faiza Imam
# Date: April 17th 2024
# Contact: faiza.imam@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(here)
library (arrow)
library(dplyr)
#### Download data ####

#The following lines of code is from https://open.toronto.ca/dataset/deaths-of-people-experiencing-homelessness/

# get package
package <- show_package("a7ae08f3-c512-4a88-bb3c-ab40eca50c5e")
package

# get all resources for this package
resources <- list_package_resources("a7ae08f3-c512-4a88-bb3c-ab40eca50c5e")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==3) %>% get_resource()
data

#Save Raw Data File.
write_csv(data, "raw_data.csv")



         

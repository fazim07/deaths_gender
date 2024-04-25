# Unveiling Vulnerabilities: An Analysis of Causes of Death Across Age Groups and Genders Within Toronto's Homelessness Population (2017 - 2023)

## Overview

This paper aims to explore the relationship between male homelessness and mortality rates across age groups, focusing on causes of death related to homelessness in Toronto from the years 2017- 2023. The hypothesis suggests that younger homeless males (<20 and 20-39) may have higher mortality rates due to harsh living conditions, limited healthcare access, and increased vulnerability. The results indicate that while male homeless mortality rates are generally higher than reported female death tolls, the most affected age demographic is the 40-59 age range rather than the hypothesized age group.

This repository contains data, code and a paper that analyzes the trends in the cause of death, age, and gender of people who are facing homelessness. The dataset used for analysis was retrieved from Open Data Toronto, under the package https://open.toronto.ca/dataset/deaths-of-people-experiencing-homelessness/ .

=======
This repository contains data, code and a paper that analyzes the trends in the cause of death, age, and gender of people who are facing homelessness. The dataset used for analysis was retrieved from Open Data Toronto, under the package [b086c5699adf045de61fb7b5b24996b4f43b850c]

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from Open Data Toronto.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## Data Extraction
The data set was obtained from Opendata Toronto; https://open.toronto.ca/dataset/deaths-of-people-experiencing-homelessness/

## Statement on Parquet File
<<<<<<< HEAD
When attempting to make a parquet file, I encountered this message which prevented me from dowloading the necessary resources:
=======
When attempting to make a parquet file, I encountered this message which prevented me from downloading the necessary resources:
>>>>>>> b086c5699adf045de61fb7b5b24996b4f43b850c

 > Error in parquet___arrow___ArrowReaderProperties__Make(isTRUE(use_threads)) : Cannot call parquet___arrow___ArrowReaderProperties__Make(). See https://arrow.apache.org/docs/r/articles/install.html for help installing Arrow C++ libraries.

The arrow package is an interface to the Apache Arrow C++ libraries, and Parquet is a columnar storage file format that is optimized for use with data analysis tools. The error message Cannot call parquet___arrow___ArrowReaderProperties__Make() specifically means that the R session tried to execute a function related to reading Parquet files but failed because it couldn't find the necessary underlying Arrow C++ library functions.


## Statement on LLM usage
Aspects of the code were fixed and aided by ChatGPT, receipts can be found in `other` > `LLM` > `usage.txt`. This paper used Chatgpt to proofread which is also indicated in the `usage.txt` file.

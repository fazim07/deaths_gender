# Unveiling Vulnerabilities: An Analysis of Causes of Death Across Age Groups and Genders Within Toronto's Homelessness Population (2017 - 2023)

## Overview

This repository contains data, code and a paper that analyzes the trends in the cause of death, age, and gender of people who are facing homelessness. The dataset used for analysis was retrieved from Open Data Toronto, under the package[update]

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
When attempting to make a parquet file, I encountered this message which prevented me from downloading the necessary resources:

 > Error in parquet___arrow___ArrowReaderProperties__Make(isTRUE(use_threads)) : Cannot call parquet___arrow___ArrowReaderProperties__Make(). See https://arrow.apache.org/docs/r/articles/install.html for help installing Arrow C++ libraries.

The arrow package is an interface to the Apache Arrow C++ libraries, and Parquet is a columnar storage file format that is optimized for use with data analysis tools. The error message Cannot call parquet___arrow___ArrowReaderProperties__Make() specifically means that the R session tried to execute a function related to reading Parquet files but failed because it couldn't find the necessary underlying Arrow C++ library functions.


## Statement on LLM usage
Aspects of the code were fixed and aided by ChatGPT, receipts can be found in `other` > `LLM` > `usage.txt`. This paper used Chatgpt to proofread which is also indicated in the `usage.txt` file.

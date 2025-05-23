# Getting and Cleaning Data Project

# Overview

This repository contains a project submission for the **Getting and Cleaning Data**.
The project involves cleaning and transforming data collected from the
[UCI Human Activity Recognition Using Smartphones Dataset](https://archive.ics.uci.edu/ml/datasets/human+activity+recognition+using+Smartphones).

The goal was to prepare a tidy dataset that can be used for later analysis,
where each variable is in one column, each observation is in one row, and
each type of observational unit forms a table.

# Files Included

- "run_analysis.R": R script used to download, clean, and transform the data into a tidy format.
- "tidy_data.txt": The final tidy dataset containing the average of each mean and standard deviation variable for each activity and subject.
- "CodeBook.md": A detailed code book describing the dataset, variables, and cleaning steps.
- "README.md": This file.

# Data Summary

The original dataset includes accelerometer and gyroscope
measurements collected from 30 subjects performing six 
different activities. From the raw data, this project:

1. Merges training and test sets.
2. Extracts only the mean and standard deviation measurements.
3. Uses descriptive activity names.
4. Appropriately labels the dataset with descriptive variable names.
5. Creates a second tidy dataset with the average of each variable for each activity and each subject.

# How to Run

To reproduce the analysis:
1. Download and unzip the dataset to your working directory.
2. Run `run_analysis.R` in R or RStudio.
3. The script will create `tidy_data.txt` in your working directory.

# Dependencies

This project uses the following R packages:
- "dplyr"
- "readr"
- "tidyverse" (optional but helpful for loading data and piping operations)

## Acknowledgments

The dataset was provided by the UCI Machine Learning Repository and was created by D. Anguita, A. Ghio, L. Oneto, X. Parra, Jorge Luis Reyes-Ortiz.
The project is part of the Coursera Data Science Specialization by Johns Hopkins University.

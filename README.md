## Getting and Cleaning Data - Course Project

This repository contains work for Coursera's [Getting and Cleaning Data](https://class.coursera.org/getdata-002) course. 

The original dataset and description can be found at the [UCI ML database](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).


## Code

`run_analysis`.R does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Code dependencies

The script uses functions from the `reshape2` library.

## Codebook

The codebook explains the features and structure of the final dataset produced by `run_analysis.R`.

## Running the script

The script expects a folder named `UCI HAR Dataset` to be present in the same directory.


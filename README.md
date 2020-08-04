# Getting-and-Cleaning-Data-Week-4-Assignment

### This repository was created for Assignment 4 of the Coursera Course "Getting and Cleaning Data".
Instructions:
1) Download the .zip file and unzip it in your R working directory.
2) Download the R source code into your R working directory.
3) Execute R source code to generate a tidy data file.

### About the data ["Human Activity Recognition Using Smartphones Dataset"](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
In this dataset, 30 subjects were used to perform six activities; these activities were measured using the sensor signals with smartphones. 
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. 
The variable in the data Y indicates activity type the subjects performed during recording.

### Code Explainantion
In this code the training and test datasets were merged in one, the partial variables were removed, and just the average values were used for each subject for the six activities, creating another dataset (tidy dataset) with only these values.

### Code was written based on the instruction of this assignment
Read the necessary files for this assignment in your R environment (subjects files, activity_labels, features, values of test and training). 

Create an R script called run_analysis.R that does the following:
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### New tidy data
The new generated tidy data contain the variables calculated based on the mean and standard deviation. Each row represents the average of the activity type for each subject.

### Files

1) `CodeBook.md` a codebook that describes the variables, the data, and any transformations or work performed to clean up the data.
2) `run_analysis.R` performs the data preparation and then followed by the 5 steps required as described in the course.
3) `tidy_data.txt` is the exported final data after going through all the sequences described above.
4) `README.md` this file, that explains the analysis and the other files.



# Getting-and-Cleaning-Data-Week-4-Assignment

## This repository was created for the Assigment 4 of the Coursera Course "Getting and Cleaning Data".
Instructions:
1) Download the .zip file and unzip it in your R working directory.
2) Download the R source code into your R working directory.
3) Execute R source code to generate tidy data file.

## About the data "Human Activity Recognition Using Smartphones Dataset"
In this data 30 subjects were used to performe six activities, this activities were mesuared using the sensor signals with smarthphones. 
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. 
The variable in the data Y indicates activity type the subjects performed during recording.

## Code Explainantion
In this code the training and test datasets were merged in one, the partial variables were removed, and just the average values were used for each subject for the six activities. Creating another dataset with just these values.

## Code was written based on the instruction of this assignment
Read the necessary files for this assigment in your R environment (subjects files, activity_labels, features, values of test and trainning). 

Create a R script called run_analysis.R that does the following:
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## New tidy data
The new generated tidy data contain the variables calculated based on the mean and standard deviation. Each row represent the average of the activity type for each subject. 



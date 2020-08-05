library(dplyr)

##Setting Directory
getwd()
setwd("C:/Users/Core i5/Desktop/Coursera/Data science/Course 3_ Getting and Cleaning Data")
getwd()

##Reading Train Data
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt") ##Value
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt") ##Activity
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") ##Subject

##Reading Test Data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt") ##Value
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt") ##Activity
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") ##Subject


##Reading feactures names Data
feature_names <- read.table("./UCI HAR Dataset/features.txt", as.is = TRUE)

##Reading Activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
##transform integer to numeric for NO NA problems later
activity_labels[,1] <- as.numeric(activity_labels[,1])


####Step 1. Merge the training and the test to create One Dataset

DataSet <- rbind(
    cbind(sub_train, x_train, y_train),
    cbind(sub_test, x_test, y_test)
)

##Change Names
colnames(DataSet) <- c("Subject", feature_names[, 2], "Activity")

##Remove first data tables to save memory
rm(x_train, y_train, sub_train, 
   x_test, y_test, sub_test)


####Step 2. Extracts the mean and SD for each measurement.

ToKeep <- grepl("Subject|mean|std|Activity", colnames(DataSet))
DataSet <- DataSet[,ToKeep]
##colnames(DataSet) to see all the columns names with the pattern


####Step 3. Uses descriptive activity names in the data set

DataSet$Activity <- factor(DataSet$Activity, 
                              levels = activity_labels[, 1], labels = activity_labels[, 2])

##to see activity names and NO NA
##DataSet$Activity 
##sum(is.na(DataSet$Activity))


####Step 4. Appropriately labels the data set with descriptive variable names.

##Get column names
DataSetcolnames <- colnames(DataSet)

##Remove special characters
DataSetcolnames <- gsub("[\\(\\)-]", "", DataSetcolnames)

##Clean up names
DataSetcolnames <- gsub("^f", "frequencyDomain", DataSetcolnames)
DataSetcolnames <- gsub("^t", "timeDomain", DataSetcolnames)
DataSetcolnames <- gsub("Acc", "Accelerometer", DataSetcolnames)
DataSetcolnames <- gsub("Gyro", "Gyroscope", DataSetcolnames)
DataSetcolnames <- gsub("Mag", "Magnitude", DataSetcolnames)
DataSetcolnames <- gsub("Freq", "Frequency", DataSetcolnames)
DataSetcolnames <- gsub("mean", "Mean", DataSetcolnames)
DataSetcolnames <- gsub("std", "StandardDeviation", DataSetcolnames)
DataSetcolnames <- gsub("BodyBody", "Body", DataSetcolnames)

##DataSetcolnames

##New names as column names
colnames(DataSet) <- DataSetcolnames


####Step 5. creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Group by subject and activity and summarise using mean
DataSetMeans <- DataSet %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

##Output to file "tidy_data.txt"
write.table(DataSetMeans, "tidy_data.txt", row.names = FALSE, quote = FALSE)

#To see tidy_data.txt
#tidy_data <- read.csv("./tidy_data.txt", sep="")
#View(tidy_data)




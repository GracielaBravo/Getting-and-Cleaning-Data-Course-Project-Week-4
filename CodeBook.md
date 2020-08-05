# Description of Tidy Dataset

The `run_analysis.R` script performs the data preparation and then the 5 steps required as described in the course project (See `README.md` file).

### 1. Download the data
  "Human Activity Recognition Using Smartphones Dataset" was downloaded and extracted under the folder called `UCI HAR Dataset`

### 2. Assignation of each data to variables
- `activity_labels` <- `activity_labels.txt` List of the six activities performed and its codes (labels)
- `feature_names` <- `feature.txt` The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
- `sub_train` <- `train/subject_train.txt` Contains train data of 21/30 volunteer subjects being observed
- `x_train` <- `train/X_train.txt` Contains recorded features train data
- `y_train` <- `train/y_train.txt` Contains train data of activities labels code
- `sub_test` <- `test/subject_test.txt` Contains test data of 9/30 volunteer test subjects being observed
- `x_test` <- `test/X_test.txt` Contains recorded features test data
- `y_test` <- `test/y_test.txt` Contains test data of activities labels code

### 3. Merge the trainning and the test to create One Dataset
- First using  the cbind() function, it was merged all the training data.
- Secondly using the cbind() function,  it was merged all the test data.
- Finally it was generated a big `DataSet` using the rbind() function.
- As an extra we change the names of the columns by "Subject", "the feature names" (from the `feature_names` data table) and finally "Activity".
- The other data tables (`x_train`, `y_train`, `sub_train`, `x_test`, `y_test`, `sub_test`) made before the creation of `DataSet` were removed to save memory.

## 4. Extracts the mean and SD for each measurement
Using de grepl() function the columns names with "mean" and "std" were selected to keep, also the "subject" and "Activity" columns in the `DataSet`.

## 5. Uses descriptive activity names in the dataset
Using the levels and labels of the `activity_labels` data table and the factor() function, The "Activity" column change the code of activity for the name of the activity in the `DataSet`.

## 6. Appropriately labels the data set with descriptive variable names
- First, I see the column names of the `DataSet`.
- Secondly, using gsub() function, take out the special characters.
- After that change the names of the features columns as follow:
  - All start with character `f` in column’s name replaced by `frequencyDomain`
  - All start with character `t` in column’s name replaced by `timeDomain`
  - All `Acc` in column’s name replaced by `Accelerometer`
  - All `Gyro` in column’s name replaced by `Gyroscope`
  - All `Mag` in column’s name replaced by `Magnitude`
  - All `Freq` in column’s name replaced by `Frequency`
  - All `mean` in column’s name replaced by `Mean`
  - All `std` in column’s name replaced by `StandardDeviation`
  - All `BodyBody` in column’s name replaced by `Body`

## 7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The average for each variable for each activity was calculated from the `DataSet` with the group_by() and summarise() functions, creating a new data called `DataSetMeans`.
Finally, this final data was created using the write.table() function with row.names = FALSE, in a file called `tidy_data.txt`.

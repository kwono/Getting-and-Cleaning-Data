# Getting and Cleaning Data Project

### The purpose of the script is to perform the following:

1. Merges the training and the test sets to create one data set.

* First load the files onto R and create an R object for each file: 
subject_test, subject_train, x_test, x_train, y_test, y_train, features, and labels.

Then combine the files together and store the result in complete_data.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

We will use the second column in features to name the columns in complete_data 
starting from column 3. 

First, create a data frame themeans that has only one column
which comes from the second column in features that contains "mean()". 
Then create thestds data frame with one column taken from the second column in features
that contains "std()". 

Merge features and themeans matching col 1 of features and col 1 of themeans, store the
result in feat_means.
Merge features and thestds matching col 1 of features and col 1 of thestds, store the
result in feat_stds.

Combine feat_means and feat_stds together, sort the result by col 1, then store in
features_mod. 
What we end up having is a modified features file whose second column contains "mean()"
and "std()". 

Create a new blank column in features_mod called V3.
Fill it with the sum of col 1 and the number 2.
Create an object called sub_cols consisting of "1", "2", "3", ..., 
where "3", ... are taken from V3 in features_mod. 
Subset complete_data by columns indices created in sub_cols, store the result in
complete_data_mod

3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 

Create an object called col_names consisting of "subject", "activity", and characters
from col 2 in features_mod.
Rename the col names if complete_data_mod by the characters just created in
col_names.
Use gsub to remove the "()" and "-" from the variable names.

Use the sub function and a for loop to rename the values of the activity,
matching them with the values of col 1 in labels.

5. From the data set in step 4, creates a second, independent tidy data set with the 
average of each variable for each activity and each subject.

Convert to dplyr table, call it tidy_data
Sort tidy_data by subject, then by activity
Group tidy_data_sorted by subject, then by activity, store it in by_sub_act
Compute the mean for each measurement, store it in summary

Write the table to tidy_data.txt file.





















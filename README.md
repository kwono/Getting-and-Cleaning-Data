# Getting and Cleaning Data Project

>This project was part of the assignments for [Coursera Getting and Cleaning Data](https://www.coursera.org/course/getdata).

>The data are taken from [UCI Machine Learning Repo](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).


### The purpose of the script is to perform the following:
 
1. Merge the training and the test sets to create one data set.

  - First load the files onto R and create an R object for each file:
*subject\_test*, *subject\_train*, *x\_test*, *x\_train*, *y\_test*, *y\_train*, *features*, and *labels*.

  - Then combine the files together and store the result in *complete\_data*.

2. Extract only the measurements on the mean and standard deviation for each measurement.

  - We will use the second column in *features* to name the columns in *complete\_data* starting from column 3.

  - First, create a data frame *themeans* that has only one column which comes from the second column in features that contains "**mean()**". Then create *thestds* data
frame with one column taken from the second column in *features* that contains "**std()**".

  - Merge *features* and *themeans* matching col 1 of *features* and col 1 of *themeans*, store the result in *feat\_means*. Merge *features* and *thestds* matching col 1 of *features* and col 1 of *thestds*, store the result in *feat\_stds*.

  - Combine *feat\_means* and *feat\_stds* together, sort the result by col 1, then store in *features\_mod*. What we end up having is a modified *features* file whose second
column contains "**mean()**" and "**std()**".

  - Create a new blank column in *features\_mod* called V3. Fill it with the sum of col 1 plus 2. Create an object called *sub\_col*s consisting of "1", "2", "3", ..., where "3", ... are taken from V3 in *features\_mod*. Subset *complete\_data*
by columns indices created in *sub\_cols*, store the result in *complete\_data\_mod*.

3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 

  - Create an object called *col\_names* consisting of "**subject**", "**activity**", and characters from col 2 in *features\_mod*. Rename the col names if *complete\_data\_mod* by the characters just created in *col\_names*. 
  
  - Use **gsub** to remove the "**()**" and "**-**" from the variable names. 
  
  - Use **tolower** to change all variable names to lower case. 

  - Use the **sub** function and a **for loop** to rename the values of the activity, matching them with the values of col 1 in labels.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

  - Convert to **dplyr** table, call it *tidy\_data*. 
  - Sort *tidy\_data* by **subject**, then by **activity**.  
  - Group *tidy\_data\_sorted* by **subject**, then by **activity**, store it in *by\_sub\_act*. 
  - Compute the **mean** for each measurement, store it in *summary*.
  - Write the table to *tidy\_data.txt* file.
  
Optional steps:

  - Use **gather** to convert the format of the table, store the result in *summary\_long*.
  - Write the table to *tidy\_data\_long.txt* file.





















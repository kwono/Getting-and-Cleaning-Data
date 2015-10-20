# /Users/katrina/Dropbox/clean/.RData

# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Load the files into R and create an R object for each file.
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Combine the files together, store the result in complete_data.
test <- cbind(subject_test, y_test, x_test)
train <- cbind(subject_train, y_train, x_train)
complete_data <- rbind(test, train)

## Subsetting the features, taking only the mean and standard deviation for the measurements, sort in ascending order, and storing the result in features_mod.
themeans <- grep("*mean\\(\\)*", features[, 2])
themeans <- as.data.frame(themeans)
thestds <- grep("*std\\(\\)*", features[, 2])
thestds <- as.data.frame(thestds)
feat_means <- merge(features, themeans, by.x = "V1", by.y = "themeans")
feat_stds <- merge(features, thestds, by.x = "V1", by.y = "thestds")
features_mod <- rbind(feat_means, feat_stds)
features_mod <- features_mod[order(features_mod$V1), ]

## Matching column names in complete_data with the rows in the second column in features_mod to extract only the columns in complete_data that have the same names. Store the result in complete_data_mod.
features_mod["V3"] <- NA 
features_mod$V3 <- features_mod$V1+2 
sub_cols <- append(c(1,2), features_mod$V3)
complete_data_mod <- complete_data[, sub_cols] ## columns 3 - 68 in complete_data_mod = rows 1 - 68 in the 3rd column in features_mod

## Naming column names
col_names <- append(c("subject", "activity"), as.character(features_mod$V2))
names(complete_data_mod) <- col_names
## Remove () and - from column names
names(complete_data_mod) <- gsub("\\(\\)", "", names(complete_data_mod))
names(complete_data_mod) <- gsub("-", "", names(complete_data_mod))

## Renaming the activities according to the activity_label file.
for(i in 1:6) {
	complete_data_mod$activity <- sub(i, labels$V2[i], complete_data_mod$activity)
}

## Convert to dplyr table
tidy_data <- tbl_df(complete_data_mod)

## Sort tidy_data by subject, then by activity
tidy_data_sorted <- arrange(tidy_data, subject, activity)

## Group tidy_data_sorted by subject, then by activity
by_sub_act <- group_by(tidy_data_sorted, subject, activity)

## Compute the mean for each measurement
summary <- summarise_each(by_sub_act, funs(mean))

## Write the table to tidy_data.txt file.
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)




# /Users/katrina/Dropbox/clean/.RData

# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## load the files into R and create an R object for each file.
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## combine the files together.
test <- cbind(subject_test, y_test, x_test)
train <- cbind(subject_train, y_train, x_train)
complete_data <- rbind(test, train)


## subsetting the complete_data file, taking only the mean and sd for the measurements. 
themeans <- grep("*mean\\(\\)*", features[, 2])
thestds <- grep("*std\\(\\)*", features[, 2])
feat_means <- merge(features, themeans, by.x = "V1", by.y = "themeans")
feat_stds <- merge(features, thestds, by.x = "V1", by.y = "thestds")
features_mod <- rbind(feat_means, feat_stds)
features_mod <- features_mod[order(features_mod$V1), ]
features_mod["V3"] <- NA
features_mod$V3 <- features_mod$V1+2

## extracting
sub_cols <- append(c(1,2), features_mod$V3)
complete_data_mod <- complete_data[, sub_cols]

## naming variables
col_names <- append(c("subject", "activity"), as.character(features_mod$V2))
names(complete_data_mod) <- col_names

## renaming the activities according to the activity_label file.
for(i in 1:6) {
	tidy_data$activity <- sub(i, labels$V2[i], tidy_data$activity)
}


write.table(tidy_data, "tidy_data.txt", row.name = FALSE)






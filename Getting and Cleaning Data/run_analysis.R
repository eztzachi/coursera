library("dplyr")

## Part 1 - Merge the training and the test sets to create one data set

# Load all the necesarry data into data frames
# load train data
subject_train <- read.table("subject_train.txt", col.names = "subject_id")
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt", col.names = "activity_type")

# load test data
subject_test <- read.table("subject_test.txt", col.names = "subject_id")
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt", col.names = "activity_type")

# load general info
featureLabels <- read.table("features.txt")
activityLabels <- read.table("activity_labels.txt", 
                             col.names = c("activity_type_id", "activity_type"))

# label the features data frame
names(X_train) <- featureLabels$V2
names(X_test) <- featureLabels$V2

# merge train and test labeled sets
merged_train <- cbind(subject_train, y_train, X_train)
merged_test <- cbind(subject_test, y_test, X_test)
merged_data <- rbind(merged_train, merged_test)
merged_data <- tbl_df(merged_data)

## Part 2 - Extract only the measurements on the mean and standard deviation
relevant_columns <- grep("mean\\(\\)|std\\(\\)", names(merged_data))
relevant_columns <- c(1:2, relevant_columns) #add subject and activity id 
merged_data <- merged_data[,relevant_columns]

## Part 3 - Use descriptive activity names to name activities in the data set
tidy_data <-
    mutate(merged_data, 
           activity_type=factor(activity_type, 
                                labels=activityLabels$activity_type))

## Part 4 - Appropriately label the data set with descriptive variable names
names(tidy_data)<-gsub("\\(\\)", "", names(tidy_data))
names(tidy_data)<-gsub("-", "_", names(tidy_data))
names(tidy_data)<-gsub("_X$", "_x", names(tidy_data))
names(tidy_data)<-gsub("_Y$", "_y", names(tidy_data))
names(tidy_data)<-gsub("_Z$", "_z", names(tidy_data))
names(tidy_data)<-gsub("^t", "time", names(tidy_data))
names(tidy_data)<-gsub("^f", "frequency", names(tidy_data))

## Part 5 - Creates an independent tidy data set with the average of each 
## variable for each activity and each subject
tidy_data <- tidy_data %>%
    group_by(subject_id, activity_type) %>%
    summarise_each(funs(mean))

# write the tidy data set to file
write.table(tidy_data, file = "tidy_data.txt", row.name=FALSE)

# remove temporary local variables from environment to save memory
rm(subject_train, X_train, y_train, subject_test, X_test, y_test, 
   activityLabels, featureLabels, merged_test, merged_train, merged_data)

# run_analysis.R does the following:
#   
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable or feature (column) names.
# 5. Creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.



setwd("E:/documents/progr/getting_and_cleaning_data_project")

X_test <- as.data.frame(read.table("UCI HAR Dataset/test/X_test.txt"))
Y_test <- as.data.frame(read.table("UCI HAR Dataset/test/Y_test.txt"))
X_train <- as.data.frame(read.table("UCI HAR Dataset/train/X_train.txt"))
Y_train <- as.data.frame(read.table("UCI HAR Dataset/train/Y_train.txt"))

main <- rbind(cbind(X_train,Y_train),cbind(X_test,Y_test))
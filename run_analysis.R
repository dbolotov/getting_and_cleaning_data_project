# run_analysis.R does the following:
#   
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable or feature (column) names.
# 5. Creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.


# setwd("E:/documents/progr/getting_and_cleaning_data_project")
setwd("C:/Users/Dmitriy/Documents/r_t/getting_and_cleaning_data_project")

# Feature names
col_names <- read.table("UCI HAR Dataset/features.txt",comment.char="",colClasses="character")
c_names <- col_names$V2 #all feature column names
c_indices <- grep("mean()|std()",c_names) #feature column numbers to keep


# Load main data set
ptm <- proc.time()
X_test <- as.data.frame(read.table("UCI HAR Dataset/test/X_test.txt",comment.char="",colClasses="numeric"))
Y_test <- as.data.frame(read.table("UCI HAR Dataset/test/Y_test.txt",comment.char="",colClasses="numeric"))
X_train <- as.data.frame(read.table("UCI HAR Dataset/train/X_train.txt",comment.char="",colClasses="numeric"))
Y_train <- as.data.frame(read.table("UCI HAR Dataset/train/Y_train.txt",comment.char="",colClasses="numeric"))
proc.time() - ptm

main <- rbind(X_train,X_test)
main <- main[,c_indices] #only keep the mean() and std() columns

main <- cbind(main,rbind(Y_train,Y_test))


names(main) <- c(c_names[c_indices],"Activity")






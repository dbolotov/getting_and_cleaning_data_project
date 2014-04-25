# run_analysis.R

# This script does the following, as specified by the project requirements:
#
# 1. Merges the training and the test sets (accelerometer data, subject, and activity) to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive activity names.
# 5. Creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.

# Forum links
# https://class.coursera.org/getdata-002/forum/thread?thread_id=396
# https://class.coursera.org/getdata-002/forum/thread?thread_id=302


setwd("E:/documents/progr/getting_and_cleaning_data_project")
# setwd("C:/Users/Dmitriy/Documents/r_t/getting_and_cleaning_data_project")



## Create first dataset

# Load feature names file
col_names <- read.table("UCI HAR Dataset/features.txt",comment.char="",colClasses="character")

# Load activity labels file
activity_names <- read.table("UCI HAR Dataset/activity_labels.txt")

# Load X (accelerometer readings) data files
X_train <- as.data.frame(read.table("UCI HAR Dataset/train/X_train.txt",comment.char="",colClasses="numeric"))
X_test <- as.data.frame(read.table("UCI HAR Dataset/test/X_test.txt",comment.char="",colClasses="numeric"))

# Load Y (activity) data files
Y_train <- as.data.frame(read.table("UCI HAR Dataset/train/Y_train.txt",comment.char="",colClasses="numeric"))
Y_test <- as.data.frame(read.table("UCI HAR Dataset/test/Y_test.txt",comment.char="",colClasses="numeric"))

# Load subject data files
subject_train <- as.data.frame(read.table("UCI HAR Dataset/train/subject_train.txt",comment.char="",colClasses="numeric"))
subject_test <- as.data.frame(read.table("UCI HAR Dataset/test/subject_test.txt",comment.char="",colClasses="numeric"))


c_names <- col_names$V2 #get all feature column names

c_indices <- grep("mean\\(\\)|std\\(\\)",c_names) #get indices of mean() and std() features

data_01 <- rbind(X_train,X_test) #combine features of test and train sets

data_01 <- data_01[,c_indices] #subset main dataset, keeping only the mean() and std() columns

data_01 <- cbind(data_01,rbind(subject_train,subject_test),rbind(Y_train,Y_test)) #attach Subject and Activity columns

names(data_01) <- c(c_names[c_indices],"Subject","Activity") #add names for every column

#replace indices with strings in Activity column
data_01$Activity <- factor(data_01$Activity,levels=1:6,labels=activity_names$V2)




## Create second dataset

data_01_melt <- melt(data_01,id.vars=c("Activity","Subject"),measure.vars=c_names[c_indices])
data_02 <- dcast(data_01_melt,formula = Subject + Activity ~ variable, mean)




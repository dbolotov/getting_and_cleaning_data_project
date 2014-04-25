# run_analysis.R does the following:
#   
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable or feature (column) names.
# 5. Creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.

#Forum links
#https://class.coursera.org/getdata-002/forum/thread?thread_id=396
#https://class.coursera.org/getdata-002/forum/thread?thread_id=302
#http://stackoverflow.com/questions/10787640/ddply-summarize-for-repeating-same-statistical-function-across-large-number-of


setwd("E:/documents/progr/getting_and_cleaning_data_project")
# setwd("C:/Users/Dmitriy/Documents/r_t/getting_and_cleaning_data_project")

## Create first dataset

# Load feature names
col_names <- read.table("UCI HAR Dataset/features.txt",comment.char="",colClasses="character")

# Load activity labels
activity_names <- read.table("UCI HAR Dataset/activity_labels.txt")

# Load main data set
ptm <- proc.time()

X_train <- as.data.frame(read.table("UCI HAR Dataset/train/X_train.txt",comment.char="",colClasses="numeric"))
Y_train <- as.data.frame(read.table("UCI HAR Dataset/train/Y_train.txt",comment.char="",colClasses="numeric"))
subject_train <- as.data.frame(read.table("UCI HAR Dataset/train/subject_train.txt",comment.char="",colClasses="numeric"))

X_test <- as.data.frame(read.table("UCI HAR Dataset/test/X_test.txt",comment.char="",colClasses="numeric"))
Y_test <- as.data.frame(read.table("UCI HAR Dataset/test/Y_test.txt",comment.char="",colClasses="numeric"))
subject_test <- as.data.frame(read.table("UCI HAR Dataset/test/subject_test.txt",comment.char="",colClasses="numeric"))

proc.time() - ptm


# Subset feature names
c_names <- col_names$V2 #all feature column names

c_indices <- grep("mean\\(\\)|std\\(\\)",c_names) #indices of mean() and std() features

main <- rbind(X_train,X_test) #combine features of test and train sets

main <- main[,c_indices] #only keep the mean() and std() columns

main <- cbind(main,rbind(subject_train,subject_test),rbind(Y_train,Y_test)) #cbind the activity column

names(main) <- c(c_names[c_indices],"Subject","Activity") #add names for every column

#replace indices with strings in Activity column
main$Activity <- factor(main$Activity,levels=1:6,labels=activity_names$V2)




## Create second dataset
mainMelt <- melt(main,id.vars=c("Activity","Subject"),measure.vars=c_names[c_indices])
mainCast <- dcast(mainMelt,Subject + Activity ~ variable, mean)




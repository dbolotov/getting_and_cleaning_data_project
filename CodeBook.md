## Codebook

This codebook describes variables and structure of the second tidy dataset produced by the code in `run_analysis.R`. 

This dataset shows mean values for a subset of accelerometer and gyroscope features, grouped by Subject and Activity.

For the purposes of this analysis, only measurements containing the strings "mean()" or "std()" were used (those containing "meanFreq()" were not used). This resulted in 66 features.

The accelerometer data are grouped by Subject and Activity, resulting in 180 rows in the final dataset.


### Grouping Variables

The two grouping variables are as follows:

* `Subject` - an integer representing a human subject: 1-30
* `Activity` - one of 6 types of activity performed by the subject: `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`


### Accelerometer and gyroscope feature name format

The 66 feature names are formatted as: `{time, frequency}{Body, Gravity}{accelerometer signal, gyroscope signal}{Jerk signal}{signal Magnitude}-{mean(), std()}-{movement axis}`. 

The following explains each portion of a feature name:

* `{time,frequency}`: time or frequency signal.
* `{Body,Gravity}`: body acceleration signal or gravity acceleration signal.
* `{accelerometer signal, gyroscope signal}`: signal originating from an accelerometer or gyroscope.
* `{Jerk signal}`: jerk signal derived from body linear acceleration and angular velocity. Present for some measurements.
* `{signal Magnitude}`: signal magnitude calculated using the Euclidean norm. Present for some measurements.
* `{mean(), std()}`: mean or standard deviation of the signal.
* `{movement axis}`: one of 3 movement axes for the signal: X, Y, Z.


### Accelerometer and gyroscope feature list
The following is a list of the 66 accelerometer and gyroscope features present in the final dataset:

```
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
```
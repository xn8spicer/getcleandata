Codebook for the Human Activity Recognition Using Smartphones Data Set extract 
========================================================

#### Input raw data files: 

* features.txt
* activity_labels.txt
* test/subject_test.txt
* test/X_test.txt
* test/Y_test.txt
* train/subject_train.txt
* train/X_train.txt
* train/Y_train.txt

#### Processing script: 

* run_analysis.R

#### Output file: 

* myTidyData.csv

### Description of Raw Data
Data was downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


#### "Features" variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals `tAcc-XYZ and tGyro-XYZ`. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (`tBodyAcc-XYZ and tGravityAcc-XYZ`) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (`tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ`). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (`tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag`). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing `fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag`. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

```
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
```

The set of variables that were estimated from these signals are listed below, ONLY THE FIRST TWO (mean and std) WERE USED IN THIS PROJECT: 

```
mean(): Mean value  ** Selected for this project
std(): Standard deviation ** Selected for this project
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.
```

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

```
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
```

### Processing

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive activity names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 


### Description of Tidy Data




The unit of analysis for each row of data is Subject/Activity. It is sorted in Activity/SubjectID order.

The data frame has 68 variables and 180 rows. 

Variable List:


```
##  [1] "subjectID"                        "activity"                        
##  [3] "tBodyAcc.mean.X.saMean"           "tBodyAcc.mean.Y.saMean"          
##  [5] "tBodyAcc.mean.Z.saMean"           "tBodyAcc.std.X.saMean"           
##  [7] "tBodyAcc.std.Y.saMean"            "tBodyAcc.std.Z.saMean"           
##  [9] "tGravityAcc.mean.X.saMean"        "tGravityAcc.mean.Y.saMean"       
## [11] "tGravityAcc.mean.Z.saMean"        "tGravityAcc.std.X.saMean"        
## [13] "tGravityAcc.std.Y.saMean"         "tGravityAcc.std.Z.saMean"        
## [15] "tBodyAccJerk.mean.X.saMean"       "tBodyAccJerk.mean.Y.saMean"      
## [17] "tBodyAccJerk.mean.Z.saMean"       "tBodyAccJerk.std.X.saMean"       
## [19] "tBodyAccJerk.std.Y.saMean"        "tBodyAccJerk.std.Z.saMean"       
## [21] "tBodyGyro.mean.X.saMean"          "tBodyGyro.mean.Y.saMean"         
## [23] "tBodyGyro.mean.Z.saMean"          "tBodyGyro.std.X.saMean"          
## [25] "tBodyGyro.std.Y.saMean"           "tBodyGyro.std.Z.saMean"          
## [27] "tBodyGyroJerk.mean.X.saMean"      "tBodyGyroJerk.mean.Y.saMean"     
## [29] "tBodyGyroJerk.mean.Z.saMean"      "tBodyGyroJerk.std.X.saMean"      
## [31] "tBodyGyroJerk.std.Y.saMean"       "tBodyGyroJerk.std.Z.saMean"      
## [33] "tBodyAccMag.mean.saMean"          "tBodyAccMag.std.saMean"          
## [35] "tGravityAccMag.mean.saMean"       "tGravityAccMag.std.saMean"       
## [37] "tBodyAccJerkMag.mean.saMean"      "tBodyAccJerkMag.std.saMean"      
## [39] "tBodyGyroMag.mean.saMean"         "tBodyGyroMag.std.saMean"         
## [41] "tBodyGyroJerkMag.mean.saMean"     "tBodyGyroJerkMag.std.saMean"     
## [43] "fBodyAcc.mean.X.saMean"           "fBodyAcc.mean.Y.saMean"          
## [45] "fBodyAcc.mean.Z.saMean"           "fBodyAcc.std.X.saMean"           
## [47] "fBodyAcc.std.Y.saMean"            "fBodyAcc.std.Z.saMean"           
## [49] "fBodyAccJerk.mean.X.saMean"       "fBodyAccJerk.mean.Y.saMean"      
## [51] "fBodyAccJerk.mean.Z.saMean"       "fBodyAccJerk.std.X.saMean"       
## [53] "fBodyAccJerk.std.Y.saMean"        "fBodyAccJerk.std.Z.saMean"       
## [55] "fBodyGyro.mean.X.saMean"          "fBodyGyro.mean.Y.saMean"         
## [57] "fBodyGyro.mean.Z.saMean"          "fBodyGyro.std.X.saMean"          
## [59] "fBodyGyro.std.Y.saMean"           "fBodyGyro.std.Z.saMean"          
## [61] "fBodyAccMag.mean.saMean"          "fBodyAccMag.std.saMean"          
## [63] "fBodyBodyAccJerkMag.mean.saMean"  "fBodyBodyAccJerkMag.std.saMean"  
## [65] "fBodyBodyGyroMag.mean.saMean"     "fBodyBodyGyroMag.std.saMean"     
## [67] "fBodyBodyGyroJerkMag.mean.saMean" "groupID"
```


### Notes on Variables listed above:

Variable `subjectID` numeric ID for 30 subjects.

Variable `activity` a factor with 6 levels

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

Names of the time/frequency feature measurements were constructed by the authors using standard abbreviations. These are described above in the description of the raw data.

> **Only the variables for the mean and std were selected  for this  project.   The original variable names were   appended with the suffix ".saMean" to distinguish them  from the variables in the raw data.**

Variable `groupID` identifies subjects in the "train" or "test" group.

# Getting and Cleaning Data Project

### Requirements for `run_analysis.R` script

* Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Description of script

The script requires the `plyr` and `stringr` packages.
Only the following files from the downloaded data bundle are actually used:

* features.txt
* activity_labels.txt
* test/subject_test.txt
* test/X_test.txt
* test/Y_test.txt
* train/subject_train.txt
* train/X_train.txt
* train/Y_train.txt

Step 1: Check for required packages `plyr` and `stringr` and install if necessary.

Step 2: Process the names of the time/frequency frequency variables in the `features.txt` file, removing punctuation.

Step 3: Read in the features data for the test and train groups from `test/X_test.txt` and `train/X_train.txt` respectively and apply the column names from Step 2 to create a dataframe for each sample group.

Step 4: Scan the column names and select only the columns representing the mean or std from each data frame.

Step 5: The activities are stored in the files `test/Y_test.txt` and `train/Y_train.txt` files as numerics.  Read those data and use the labeling information in the file `activity_label.txt` file to create a labelled factor variable named `activity`. Add this to the data frame for each sample group.

Step 6: Obtain the subject ID numbers from the files `test/subject_test.txt` and `train/subject_train.txt` and add them to the data frames for each sample group.

Step 7: Merge the test and training data frames.

Step 8: Using the `aggregate` function, calculate the mean for each time/frequency feature for each subject and activity.   Append `.saMean` to each column name to distinguish it as the calculated mean.

Step 9: Add a new variable `groupID` to identify from which sample group each subject was pulled.

Step 10: Write the dataframe as a .csv file with the name `myTidyData.csv`.
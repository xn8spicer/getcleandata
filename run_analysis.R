# Coursera Getting and Cleaning Data
# Peer Assignment Week 3 

# This script requires two packages, check to see whether you have them
list.of.packages <- c("plyr", "stringr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
# Load packages
library(plyr)
library(stringr)

# The script assumes that the data downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# has been unzipped in your current working directory
# and retains the original folder name "UCI HAR Dataset"

# This script does most of the processing prior to merging the 
#  test and train data.   Maybe not a great idea, but wanted to 
#  be able to isolate any problems

# Get variable names for the 561 time/frequency raw data
#   accelerameter features
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)

# Strip out special characters in variable names
featurenames <- str_replace_all(features[,2], "([(),])" ,"" )

# create data frame of 561 time and frequency readings for each group
testX <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
trainX <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
# rename columns  
colnames(testX) <- featurenames
colnames(trainX) <- featurenames

# REQUIREMENT 2 - Subset columns with mean and std
keepPattern <-  "mean|std"
test <- testX[, str_detect(names(testX), keepPattern) ]
train <- trainX[,str_detect(names(trainX),keepPattern) ]
# Ooops, meanFreq needs to go too
keepList<- !str_detect(names(test), "meanFreq")
test  <- test[, keepList]
train <- train[,keepList]
# Verify that names match 
identical(names(test), names(train))

# Activity names, use as factor labels
testY <- read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE)
trainY <- read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE)


# REQUIREMENT 3 & 4 Create factor variable using activity labels data and the "Y" data
activitynames <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
test$activity  <- factor(testY$V1, levels=c(1,2,3,4,5,6), labels=activitynames[,2] )
train$activity <- factor(trainY$V1, levels=c(1,2,3,4,5,6), labels=activitynames[,2] )
# Confirm that these match
identical(names(test), names(train))

# 30% of subjects in the test group
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names=c("subjectID"))
# 70% of subjects in the train group
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names=c("subjectID"))

# Create subjectID variable
test <- cbind(test, testSubject)
train <- cbind(train, trainSubject)

# REQUIReMENT 1 Combine two dataframes
alldata <- rbind.fill(test, train)

# REQUIREMENT 5 Calculate group means in new data frame
# Really should not rely on column numbers here
myTidyData <- aggregate(alldata [, 1:65], by=list(alldata$subjectID, alldata$activity), FUN=mean, na.rm=TRUE)

# Relabel means
names(myTidyData) <- paste(names(myTidyData), ".saMean", sep="")
myTidyData <- rename(myTidyData,c("Group.1.saMean" = "subjectID", "Group.2.saMean" = "activity"))

# Create groupID variable
testIDs <- unique(testSubject$subjectID)
myTidyData$groupID <- ifelse(myTidyData$subjectID %in% testIDs, "test", "train")

# Save file as csv
write.csv(myTidyData, file="myTidyData.csv", row.names=FALSE)

# for more information see the CodeBook.md file
#You should create one R script called run_analysis.R that does the following. 
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 
#5.From the data set in step 4, creates a second, independent tidy data set with the 
#  average of each variable for each activity and each subject.


require(dplyr)
require(tidyr)

#Import training and test datasets and labels
train <- read.table("train//X_train.txt")
trainLabels <- read.table("train/y_train.txt")
trainSubject <- read.table("train/subject_train.txt")
test <- read.table("test//X_test.txt")
testLabels <- read.table("test/y_test.txt")
testSubject <- read.table("test/subject_test.txt")

df <- rbind(train,test) #appends the test dataset to the train dataset
dfActivities <- rbind(trainLabels,testLabels) #appends the test labels to the train labels
names(dfActivities) <- "activityID"
dfSubjects <- rbind(trainSubject,testSubject) #appends the test subjects to the train subjects
names(dfSubjects) <- "subjectID"

featuresText <- read.table("features.txt") #Import headers
featuresText<- paste(featuresText[,1],featuresText[,2],sep=",")
names(df) <- tolower(featuresText) #apply lower case names to data
df <- cbind(select(df,contains("mean")),select(df,contains("std"))) #extracts only columns with mean and std in the name

activityLabels <- read.table("activity_labels.txt") #import activity labels
names(activityLabels) <- c("activityID","activityDescription")

dfActivities <- left_join(dfActivities,activityLabels) #joins description from activityLabels to the ID of the activity
df <- cbind(dfActivities,dfSubjects,df) #join activities to the main data frame
dfTidy <- df %>%
        select(-activityID) %>%
        gather(variable,mean,-activityDescription,-subjectID) %>%
        filter(grepl('mean', variable))


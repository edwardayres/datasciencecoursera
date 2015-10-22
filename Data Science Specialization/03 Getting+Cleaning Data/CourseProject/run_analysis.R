## Set working directory
setwd("C:/Users/eayres/Documents/Data Science Specialization/03 Getting+Cleaning Data/CourseProject/UCI HAR Dataset/")

## Step 1 - 
## Load test data
library(data.table)
subject_test <- fread(input="test/subject_test.txt", sep=",")
X_test <- fread(input="test/X_test.txt", sep=" ")
Y_test <- fread(input="test/Y_test.txt", sep=",")

## Combine test datasets
test <- cbind(subject_test, Y_test, X_test)

## Load training data
subject_train <- fread(input="train/subject_train.txt", sep=",")
X_train <- fread(input="train/X_train.txt", sep=" ")
Y_train <- fread(input="train/Y_train.txt", sep=",")

## Combine training datasets
train <- cbind(subject_train, Y_train, X_train)

## Combine training and test datasets
data <- rbind(test, train)

## Remove data that is no longer needed
remove(X_train, X_test, Y_train, Y_test, train, test)

## Step 2 - 
## Read in X column names
Xcol <- fread(input="features.txt", sep=" ")

## Assign column names
colnames(data) <- c("subject", "activity", Xcol$V2)

## Select columns for subject, activity and all mean and std cols
library(dplyr)
data2 <- select(data, contains("subject"), contains("activity"), contains("mean"), contains("std"), -contains("freq"),
                -contains("angle"))

## Step 3 & 4
## Read in activity labels
Label <- fread(input="activity_labels.txt", sep=" ")

## Replace activity numbers with activity labels
data2$activity[which(data2$activity == 1)] <- 'Walking'
data2$activity[which(data2$activity == 2)] <- 'Walking upstairs'
data2$activity[which(data2$activity == 3)] <- 'Walking downstairs'
data2$activity[which(data2$activity == 4)] <- 'Sitting'
data2$activity[which(data2$activity == 5)] <- 'Standing'
data2$activity[which(data2$activity == 6)] <- 'Laying'

## Step 5 
tidy_data <- aggregate(data2, by=list(data2$subject,data2$activity), FUN=mean, na.rm=TRUE)
tidy_data[,3] <- NULL
tidy_data[,3] <- NULL
names(tidy_data)[1]<-paste("subject")
names(tidy_data)[2]<-paste("activity")

write.table(tidy_data, file = "tidy_data.txt", row.name=FALSE)

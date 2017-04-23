## Script to process UCI HAR Dataset: Human Activity Recognition Using Smartphones Dataset
## Script authored by: Yvonne Glanville (April 2017)

## Experiment performed by: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
## Smartlab - Non Linear Complex Systems Laboratory
## DITEN - Università degli Studi di Genova.
## Via Opera Pia 11A, I-16145, Genoa, Italy.

## Citation
## [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
## Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support 
## Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 


## Experimental Set Up
## 30 particpants broken into a training group and a test group 
## wore a Samsung Galaxy II smartphone on their waists, and
## performed 6 activities (Walking, Walking Upstairs, Walking Downstairs
## Sitting, Standing, and Laying). Data was taken from the embedded accelerometer 
## and gyroscope in the smartphone and the data was pre-processed and filtered.  
## For details on the pre-processing and filtering performed by the experimental group
## refer to the citation above. 

## Objective of run_analysis. R script as per the John Hopkins Get and Clean Data Course
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with 
##    the average of each variable for each activity and each subject.

## Information neccessary to use this script
## 1. Version of RStudio Version 1.0.136 – © 2009-2016 RStudio, Inc.
## 2. Packages needed: Stringr, dplyr
## set working directory to the base directory UCI HAR Dataset


########################## Start of Script ######################################################
## store name of working directory
base_directory <- getwd()

## set work directory for features
setwd(base_directory)

## read features file, which contains names of features calculated from
##smartwatch sensors
features <- read.table("features.txt")
## create a vector to store the names of the features 
namesoffeatures<-length(features$V2)
## Change names of features from factor to character
features$V2 <- as.character(features$V2)
## Place names of features into namesoffeatures vector
for(j in 1:length(features$V2)){
  namesoffeatures[j]<- features$V2[j]
}


############################ Test Data Processing Section ###############################################
## set work directory for test data
test_directory <- paste(base_directory, "/test", sep="")
setwd(test_directory)

## read in information about experiment subjects
test_subject_data <- read.table("subject_test.txt")
## rename the column with descriptive name
names(test_subject_data)<-"subject_ID"

## calculate the number of observations taken on each subject
## and save a data frame for use in breaking up the data
test_subject_numbers <- as.data.frame(table(test_subject_data))

## read X_test txt file which has the 561 features data
X_test <- read.table("X_test.txt")

## y_test file identifies activity (walking, sitting, etc.) being monitored
y_test <- read.table("y_test.txt")
## rename the column with descriptive name
names(y_test) <- "activity_code"
## change the column names of X_test to desciptive names
names(X_test) <- namesoffeatures

## Select the column of interest in X_test all columns which 
## give a mean or standard deviation
strings <- c("mean", "std")
matches_test <- suppressWarnings(str_match(names(X_test),strings)) 
meanANDstd_test <- X_test[,which(matches_test %in% strings)]

## bind columns subject id and activity id
bind_id_and_activity_test <- cbind(test_subject_data,y_test)
## bind all test data
all_test_data <- cbind(bind_id_and_activity_test,meanANDstd_test)
## Subset test data by activity
Walking_test_data <- all_test_data[all_test_data$activity_code==1,]
Walking_upstairs_test_data <- all_test_data[all_test_data$activity_code==2,]
Walking_downstairs_test_data <- all_test_data[all_test_data$activity_code==3,]
Sitting_test_data <- all_test_data[all_test_data$activity_code==4,]
Standing_test_data <- all_test_data[all_test_data$activity_code==5,]
Laying_test_data <- all_test_data[all_test_data$activity_code==6,]

##################### Training Data Processing Section #############################
## set work directory for train data
train_directory <- paste(base_directory, "/train", sep="")
setwd(train_directory)


## read in information about experiment subjects in the training group
train_subject_data <- read.table("subject_train.txt")
## rename the training data columns with descriptive name
names(train_subject_data)<-"subject_ID"

## calculate the number of observations taken on each subject
## and save a data frame for use in breaking up the data
train_subject_numbers<-as.data.frame(table(train_subject_data))

## read X_test txt file which has the 561 features data
X_train <- read.table("X_train.txt")

## y_test file identifies activity (walking, sitting, etc.) being monitored
y_train <- read.table("y_train.txt")
## rename the column with descriptive name
names(y_train) <- "activity_code"
## change the column names of X_test to desciptive names
names(X_train) <- namesoffeatures

## Select the column of interest in X_train all columns which 
## give a mean or standard deviation
strings <- c("mean", "std")
matches_train <- suppressWarnings(str_match(names(X_train),strings)) 
meanANDstd_train <- X_train[,which(matches_train %in% strings)]

## bind columns subject id and activity id
bind_id_and_activity_train <- cbind(train_subject_data, y_train)
## bind all train data
all_train_data <- cbind(bind_id_and_activity_train, meanANDstd_train)
## Subset train data by activity
Walking_train_data <- all_train_data[all_train_data$activity_code == 1,]
Walking_upstairs_train_data <- all_train_data[all_train_data$activity_code == 2,]
Walking_downstairs_train_data <- all_train_data[all_train_data$activity_code == 3,]
Sitting_train_data <- all_train_data[all_train_data$activity_code == 4,]
Standing_train_data <- all_train_data[all_train_data$activity_code == 5,]
Laying_train_data <- all_train_data[all_train_data$activity_code == 6,]


############# Combining test and training data #################################################
WalkingData <- rbind(Walking_test_data, Walking_train_data) 
WalkingUpstairsData <- rbind(Walking_upstairs_test_data, Walking_upstairs_train_data)
WalkingDownstairsData <- rbind(Walking_downstairs_test_data, Walking_downstairs_train_data)
SittingData <- rbind(Sitting_test_data, Sitting_train_data)
StandingData <- rbind(Standing_test_data, Standing_train_data)
LayingData <- rbind(Laying_test_data, Laying_train_data)
TestANDTrainData <- rbind(all_test_data, all_train_data)

## Change activity code from a nymber to a descriptive
TestANDTrainData$activity_code[TestANDTrainData$activity_code == 1] <- "Walking" 
TestANDTrainData$activity_code[TestANDTrainData$activity_code == 2] <- "Walking_upstairs"
TestANDTrainData$activity_code[TestANDTrainData$activity_code == 3] <- "Walking_downstairs"
TestANDTrainData$activity_code[TestANDTrainData$activity_code == 4] <- "Sitting" 
TestANDTrainData$activity_code[TestANDTrainData$activity_code == 5] <- "Standing" 
TestANDTrainData$activity_code[TestANDTrainData$activity_code == 6] <- "Laying" 

## Find the mean of each variable based on activity code grouping
summaryofData <- TestANDTrainData %>% group_by(activity_code) %>% summarise_each(funs(mean))
summaryofData <- summaryofData[, -2]
changecolumnnames <- length(summaryofData)
changecolumnnames[1] <- "Activity" 
for(i in 2:length(summaryofData)){
  changecolumnnames[i] <- paste("MEAN", names(summaryofData[i]), sep = " ")
}
names(summaryofData)  <- changecolumnnames

## write out tidy data files
setwd("C:/JHClass/GetCleanData/Week4/UCI_HAR_Dataset")
## tidy data for indiviual activties
write.csv(WalkingData, "WalkingData.csv") 
write.csv(WalkingUpstairsData, "WalkingUpstairsData.csv") 
write.csv(WalkingDownstairsData, "WalkingDownstairsData.csv")
write.csv(SittingData, "SittingData.csv") 
write.csv(StandingData, "StandingData.csv") 
write.csv(LayingData, "LayingData.csv")
## tidy data for all activities
write.csv(TestANDTrainData, "TestANDTrainData.csv") 
## summary of means for all tidy data
write.csv(summaryofData, "summaryofData.csv")


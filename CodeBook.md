---
title: "CodeBook"
output: github_document
---
#### Author: Yvonne Glanville

## Code Book

#### Information neccessary to use the script, run_analysis.R
#### 1. Version of RStudio Version 1.0.136 – © 2009-2016 RStudio, Inc.
#### 2. Packages needed: Stringr, dplyr
#### 3. set working directory to the base directory UCI HAR Dataset (e.g. setwd("C:/UCI_HAR_Dataset"))

####Tidy Data Files: Output from running run_analysis.R 
####  "WalkingData.csv", "WalkingUpstairsData.csv", "WalkingDownstairsData.csv", "SittingData.csv", "StandingData.csv", LayingData.csv", "TestANDTrainData.csv", "summaryofData.csv"

####Variables Names Below   
####Units of Variables: accelerometer variable denoted as Acc in 3 dimensions with respect to gravity 'g', and gyroscope data denoted by gyro in units of radians per second


"subject_ID"  - denotes which of 30 participants was wearing the Samsung Galaxy II smartwatch                 
"activity_code" - one of six activities recorded by smartphone              
"tBodyAcc-mean()-X"          
"tBodyAcc-mean()-Z"           
"tBodyAcc-std()-X"            
"tBodyAcc-std()-Z"           
"tGravityAcc-mean()-X"        
"tGravityAcc-mean()-Z"        
"tGravityAcc-std()-X"        
"tGravityAcc-std()-Z"         
"tBodyAccJerk-mean()-X"       
"tBodyAccJerk-mean()-Z"      
"tBodyAccJerk-std()-X"        
"tBodyAccJerk-std()-Z"        
"tBodyGyro-mean()-X"         
"tBodyGyro-mean()-Z"          
"tBodyGyro-std()-X"           
"tBodyGyro-std()-Z"          
"tBodyGyroJerk-mean()-X"      
"tBodyGyroJerk-mean()-Z"      
"tBodyGyroJerk-std()-X"      
"tBodyGyroJerk-std()-Z"       
"tBodyAccMag-mean()"          
"tBodyAccMag-std()"          
"tBodyAccJerkMag-mean()"      
"tBodyAccJerkMag-std()"       
"tBodyGyroJerkMag-mean()"    
"tBodyGyroJerkMag-std()"      
"fBodyAcc-mean()-Y"           
"fBodyAcc-std()-Y"           
"fBodyAcc-meanFreq()-Y"       
"fBodyAccJerk-mean()-X"       
"fBodyAccJerk-mean()-Z"      
"fBodyAccJerk-std()-X"        
"fBodyAccJerk-std()-Z"        
"fBodyAccJerk-meanFreq()-X"  
"fBodyAccJerk-meanFreq()-Z"   
"fBodyGyro-mean()-Y"          
"fBodyGyro-std()-Y"          
"fBodyGyro-meanFreq()-Y"      
"fBodyAccMag-mean()"          
"fBodyAccMag-std()"          
"fBodyAccMag-meanFreq()"      
"fBodyBodyGyroMag-mean()"     
"fBodyBodyGyroMag-std()"     
"fBodyBodyGyroMag-meanFreq()"

##Summary Choices
The run_analysis.R script outputs eight .csv files.  In the first six files, the test and training groups are combine, and then the means and standard deviations of the accelerometer and gyroscope data with respect to activity are written to .csv files with the descriptive names as shown "WalkingData.csv", "WalkingUpstairsData.csv", "WalkingDownstairsData.csv", "SittingData.csv", "StandingData.csv", LayingData.csv", 
Finally, the file, "TestANDTrainData.csv", which contains all data on means and standard deviations for all activities for both the test and training groups is output along with a summary of the means for each column based on activity, "summaryofData.csv".

## Study Design

Experiment performed by: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.

Citation
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support 
Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 

Experimental Set Up
30 particpants broken into a training group and a test group wore a Samsung Galaxy II 
smartphone on their waists, and performed 6 activities (Walking, Walking Upstairs, 
Walking Downstairs, Sitting, Standing, and Laying). Data was taken from the embedded 
accelerometer and gyroscope in the smartphone and the data was pre-processed and filtered.  
For details on the pre-processing and filtering performed by the experimental group
refer to the citation above. 


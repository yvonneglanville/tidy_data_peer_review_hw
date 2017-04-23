##  Instructions for user    
Information neccessary to use this script
1. Version of RStudio Version 1.0.136 – © 2009-2016 RStudio, Inc.
2. Packages needed: Stringr, dplyr
3. Begin by setting working directory in RStudio to the raw data directory (e.g. setwd("c:/UCI_HAR_Dataset")
4. Highlight and run script. The tidy data, which contains the means and standard deviations of the 
   accelerometer and gyroscope smartphone data, in .csv file format will be output to the working directory.


## How script works...
Once the user sets the working directory, which houses the UCI HAR Dataset files
the first file read into RStudio is teh features file which lists the clumn names.
The column names are converted from factor to character and stored in a vector for 
later use.  Since the participants were grouped as either test subjects or training 
subjects, and therefore had separate file folders the following processes were completed 
twice, once for the test data and once for the training data. The data, X_test(X_train),
subject data, subject_test, and the activity code information was read in was using read.table.
Descriptive column names were added and the the files bound together. Columns, which gave means 
and standard deviations were selected as the variables of interest. Once one test and train 
data frames were created they were bound together to create one complete data frame TestANDTrainData,
which were output along with a summary of the means for each column grouped by activity. Also, for
completeness data was also output by activity.

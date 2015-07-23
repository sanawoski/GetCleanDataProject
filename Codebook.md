---
title: "ProjectCodebook"
author: "Michael Xu"
date: "July 22, 2015"
output: html_document
---

Data contains measurments on 30 subjects wearing smartphone sensors while performing one of six different activities

Data was originally split into test and train datasets, with approximately 30% of observations in the test data and 70% in training data

Datasets were merged using cbind and rbind functions as follows


Variables in tidy dataset

Subject - 1-30 indicating which subject

Activity - one of six activities including WALKING, WALKING UPSTAIRS,  WALKING DOWNSTARIS, SITTING, STANDING, and LAYING

Measurement variables were inlcuded in the following manner:

Measurements were obtained from accelerometer/gyroscope 3-axial signals - in xyz axis
prefix t in front of variable indicates time measurement - capture at 50Hz
prefix f indicates frequency domain signals 
We included variables that expressed mean or standard deviation measurements for the variable

The full list includes

tBodyAcc xyz mean/std 
tGravityAcc mean/std xyz 
tBodyAccJerk mean/std xyz 
tBodyGyro mean/std xyz 
tbodyGyroJerk mean/std 
tBodyAccMag-mean/std 
tGravityAccMag-mean/std 
tBodyAccJerkMag-mean/std 
tBodyGyroMag-mean/std 
tBodyGyroJerkMag-mean/std 
fBodyAcc-mean/std xyz
fBodyAccJerk-mean/std xyz 
fBodyGyro-mean/std xyz 
fBodyAccMag-mean/std 
fBodyBodyAccJerkMag-mean/std 
fBodyBodyGyroMag-mean/std 
fBodyBodyGyroJerkMag-mean/std

Those columns from original dataset were extracted from merged dataset
To output tidy dataset, averages for each measurement were taken for each subject and activity - eg for Subject 1 Activity 1 all measurements for tBodyAcc x mean were averaged and output as a single observation in new dataset




---
title: "README"
author: "Michael Xu"
date: "July 22, 2015"
output: html_document
---

Explanation for analysis Script for cleaning and producing tidy dataset

1) Merges the training and the test sets to create one data set.

This was done by reading the various datasets (X_train, y_train, subject_train, etc.) into R and then combined
primarily using cbind and rbind functions. Test/train datasets were combined using rbind functions, while y/subject datasets were merged with x dataset using cbind function to put subject/y columns first in resulting dataframe

2) Extracts only the measurements on the mean and standard deviation for each measurement. 

Variables with mean/std were selected from features.txt table and columns recorded so that only those variables with a mean/std measurement were subsetted from merged dataset

3) Uses descriptive activity names to name the activities in the data set
Activity names were copied from activity_labels.txt and read into R. Activity column in subsetted data was converted to a factor variable with labels corresponding to activity labels

4) Appropriately labels the data set with descriptive variable names. 

Variable names were acquired from features.txt and names() function was used to input names of variables into dataset. 

5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

sapply function was nested inside a for loop used for every subject (1:30) and every activity (1:6) to get mean of each variable measurement for each subject and each activity. The resulting dataframe for each subject was then combined to output using rbind function 



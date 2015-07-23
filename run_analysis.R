
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
#main file containing 561 variables
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
#indicating which activity for each row
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")
#indicate subjects 1-30 for test
testbind <- cbind(xtest, ytest, subject_test)
#bind xtest, ytest, subject_test into single dataframe; column 562 = ytest and column 563 = subject_test


xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

xbind <- rbind(xtest, xtrain)
ybind <- rbind(ytest, ytrain)
subjectbind <- rbind(subjecttest, subjecttrain)

"""
tBodyAcc xyz mean/std - col 1:6
tGravityAcc mean/std xyz - col 41:46
tBodyAccJerk mean/std xyz - col 81:86
tBodyGyro mean/std xyz - col 121:126
tbodyGyroJerk mean/std - col 161:166
tBodyAccMag-mean/std - 201:202
tGravityAccMag-mean/std - 214:215
tBodyAccJerkMag-mean/std - 227:228
tBodyGyroMag-mean/std - 240:241
tBodyGyroJerkMag-mean/std - 253:254
fBodyAcc-mean/std xyz - 266:271
fBodyAccJerk-mean/std xyz - 345:350
fBodyGyro-mean/std xyz - 424:429
fBodyAccMag-mean/std - 503:504
fBodyBodyAccJerkMag-mean/std - 516:517
fBodyBodyGyroMag-mean/std - 529:530
fBodyBodyGyroJerkMag-mean/std-542:543

"""
extractedcolumns <- c(1:6, 41:46, 81:86,121:126,161:166,201:202,214:215,227:228,
                      240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)

mean.std.measurements <- xbind[,extractedcolumns]
merged.data <- cbind(subjectbind, ybind, mean.std.measurements)
#column 1 = subjects, col 2 = activities, col 3:n are measurements


activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
#activity labels = 1-6 which activity

merged.data[,2] <- factor(merged.data[,2], levels = 1:6, labels = activitylabels[,2])
#turn column 2 to factor with activity labels

featurelabels <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
extractedlabels <- featurelabels[extractedcolumns,2]
#names of measurement variables that were extracted
columnnames <- c("Subject", "Activity", extractedlabels)
names(merged.data) <- columnnames
#set variable names in dataset

tidydata <- data.frame(matrix(nrow = 0, ncol = 68))
names(tidydata) <- columnnames

for(i in 1:30) {
        singlesubjectoutput <- sapply(1:6, function(y) {
                                        mergesubset <- subset(merged.data, merged.data$Subject == i 
                                        & as.numeric(merged.data$Activity) == y)
                                        colMeans(mergesubset[,3:dim(mergesubset)[2]]) 
                                        })
        singlesubjectoutput <- t(singlesubjectoutput)
        Subject  <- rep(i,6)
        Activity <- 1:6
        singlesubjectoutput <- cbind(Subject, Activity, singlesubjectoutput)
        
        tidydata  <- rbind(tidydata, singlesubjectoutput)
        
}

tidydata[,2] <- factor(tidydata[,2], levels = 1:6, labels = activitylabels[,2])
#convert activity to factor labels

write.table(tidydata, file = "tidydataset.txt", row.names = FALSE)




### for reading/viewing tidydataset

tidydata <- read.table("tidydataset.txt", header = TRUE)
View(tidydata)







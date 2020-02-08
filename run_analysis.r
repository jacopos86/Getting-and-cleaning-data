# getting and cleaning data: course project

# load activities and features info
# dataset variables are in features.txt
# dataset observations in y_train.txt and subject_train.txt
# y_train.txt describes the activity performed
# subject_train.txt the individual performing the activity

# download files
if (!file.exists("getdata_projectfiles_UCI HAR Dataset.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "getdata_projectfiles_UCI HAR Dataset.zip")
  unzip("getdata_projectfiles_UCI HAR Dataset.zip")
}
setwd("UCI HAR Dataset")

library(dplyr)
# load variables names (features)
varnames <- read.table("features.txt")
# load activity labels
activity_labels <- read.table("activity_labels.txt")

# load train data set
setwd("train")
Xtrain <- read.table("X_train.txt", sep="")
# select only mean and std measurements
col_list <- c(grep("(.*)mean(.*)", varnames[,2]), grep("(.*)std(.*)", varnames[,2]))
col_list <- sort(col_list, decreasing = F)
varnames2 <- varnames[col_list,]
Xtrain2 <- Xtrain[,col_list]
names(Xtrain2) <- varnames2[,2]
# load subject train
subj_train <- read.table("subject_train.txt")
names(subj_train) <- "subject"
# load y_train.txt -> activity for each measurements
y_train <- read.table("y_train.txt")
names(y_train) <- "activity"
# replace each activity with its name
y_train[,1] <- activity_labels[y_train[,1],2]
# add the subject and activity as new data frame variables
Xtrain2 <- cbind(y_train, Xtrain2)
Xtrain2 <- cbind(subj_train, Xtrain2)
rm(Xtrain)

# collect also test data
setwd("../test")
Xtest <- read.table("X_test.txt", sep="")
Xtest2 <- Xtest[,col_list]
names(Xtest2) <- varnames2[,2]
# load subject test
subj_test <- read.table("subject_test.txt")
names(subj_test) <- "subject"
# load y_test.txt -> activity for each measurements
y_test <- read.table("y_test.txt")
names(y_test) <- "activity"
# replace each activity with its label
y_test[,1] <- activity_labels[y_test[,1],2]
# add subject and activity as new data frame variables
Xtest2 <- cbind(y_test, Xtest2)
Xtest2 <- cbind(subj_test, Xtest2)
rm(Xtest)
# merge the two data sets
X <- rbind(Xtrain2, Xtest2)

# create a new data set with the average of each variable 
# for every activity and subject
by_subjact <- group_by(X, subject, activity)
Xfinal <- summarise_all(by_subjact, mean)
rm(X)
rm(Xtrain2)
rm(Xtest2)
setwd("../")
df <- data.frame(Xfinal)
write.table(df, file = "final_data.txt", row.names = F)
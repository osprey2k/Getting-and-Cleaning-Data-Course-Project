## Getting and Cleaning Data Course Project
## Author: osprey2k
## Date: 6/3/2016

## Section 1 of the code imports the data needed for the project in "fileURL"
## variable and stores in a directory specified by "savePath" and 
## "saveFile" variables.  The imported zip file is then unzipped and contents
## saved in the "SavePath" folder.

## Begin Section 1
fileURL="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
savePath= "C://Users//mommabear//Desktop//Coursera//Cleaning Data//Course Project"
saveFile="project_data.zip"

download.file(fileURL, destfile=file.path(savePath,saveFile,fsep="//"))

unzip(file.path(savePath,saveFile,fsep="//"),exdir=file.path(savePath))

setwd(file.path(savePath,"UCI HAR Dataset",fsep="//"))

## End Section 1

## Section 2 of the code imports the data, labels, and subjects for the training/test sets
## Also imports the header names (features dataset) and the activity labels for the data
## Begin Section 2
train_data <- read.table(file.path(getwd(),"train","X_train.txt",fsep="//"))
train_label <- read.table(file.path(getwd(),"train","y_train.txt",fsep="//"))
train_subj <- read.table(file.path(getwd(),"train","subject_train.txt",fsep="//"))

test_data <- read.table(file.path(getwd(),"test","X_test.txt",fsep="//"))
test_label <- read.table(file.path(getwd(),"test","y_test.txt",fsep="//"))
test_subj <- read.table(file.path(getwd(),"test","subject_test.txt",fsep="//"))

features <- read.table(file.path(getwd(),"features.txt",fsep="//"))
act_label <- read.table(file.path(getwd(),"activity_labels.txt",fsep="//"))
## End Section 2

## Section 3 updates the data to use the headers names (features dataset) and add the subject and
## activity variables to the data
## Begin Section 3
names(train_data) <- features$V2
train_data[,"subject"] <- train_subj
train_data[,"activity"] <- train_label

names(test_data) <- features$V2
test_data[,"subject"] <- test_subj
test_data[,"activity"] <- test_label

## End Section 3
## Section 4 merges the train_data and the test_data data frames, subsets to relevant variables,
## and add descriptive activity names
mergedData <- merge(train_data,test_data,all=TRUE)

## extract only the variables where the measurement name includes "mean()" or "std()"
mergedData2 <- mergedData[,c(562,563,grep("mean\\(|std\\(",names(mergedData)))]

names(act_label) <- c("activity","act_desc")

## get descriptive activity names from act_label dataset
mergedData3 <- merge(mergedData2,act_label,by.x="activity",by.y="activity",all=TRUE)

## End Section 4
## Section 5 creates a dataset with an average of each variable for every activity and subject
## and exports resulting final dataset
mergedData4 <- aggregate(mergedData3[,3:67],list(Subject=mergedData3$subject,Activity=mergedData3$act_desc),mean)


write.table(mergedData4,file.path(savePath,"FinalDataSet.txt",fsep="\\"),sep=",",row.names=FALSE)

## End Section 5
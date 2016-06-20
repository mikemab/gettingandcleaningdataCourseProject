#Loads packages to be used in the R script

library(dplyr)
library(reshape2)

setwd("..")
getwd()
#The Following code will download the Human Activity Recongintion Using Smartphones Dataset

#This is were the data is located
dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#This creates an empty zip file if no zip file exists
if(!file.exists("UCIDataset.zip")){
     file.create("UCIDataset.zip")
     download.file(dataURL, destfile = "UCIDataset.zip")
}

#This downloads the data from the web to the empty zip file


#This unzips the loaded zip file in the local directory
if (!file.exists("UCI HAR Dataset")){
unzip("UCIDataset.zip")
}
##Exploring the data

setwd("./UCI HAR Dataset")

#activity labels
activity_labels <- read.table("activity_labels.txt")
head(activity_labels)
act_labels <- as.character(activity_labels[,2])
act_labels <- tolower(act_labels) #activity labels vector

features <- read.table("features.txt") #This loads the column varaible names for the X_* datasets
fnames <- as.character(features[,2])
head(fnames); tail(names)

#This gets the subset of the means and standard deviation varaibles
fmeanstd <- grep(".*mean.*|.*std.*", fnames)
fmeanstd

wanted_fnames <- fnames[fmeanstd]
wanted_fnames <- gsub("[-()]","",wanted_fnames) #removes the () from the varaible name
wanted_fnames <- gsub(" ","",wanted_fnames,fixed=TRUE) #removes spaces from names
wanted_fnames <- tolower(wanted_fnames) #makes everything lower case
#Data set 
trainx <- read.table("./train/X_train.txt"); dim(trainx) #Loads the training set
testx <- read.table("./test/X_test.txt"); dim(testx) #Loads the test set

#Takes the full dataset and subsets it to the mean and standard deivation varaibles
subtrainx <- trainx[fmeanstd]
subtestx <- testx[fmeanstd]

#Sets the names of the varaibles
names(subtrainx) <- wanted_fnames
names(subtestx) <- wanted_fnames

head(subtrainx)
#Activity Indentifier
trainy <- read.table("./train/Y_train.txt"); dim(trainy) #Loads the activity labels (i.e Walking, Walking_Upstairs, Walking Downstairs, Sitting, Standings, Laying)
testy <- read.table("./test/Y_test.txt"); dim(testy) #Loads the activity labels (i.e Walking, Walking_Upstairs, Walking Downstairs, Sitting, Standings, Laying)

#Make tidy names

names(trainy) <- "act_id"
names(testy) <- "act_id"
#Subjects indentifier (1-30)

subject_train <- read.table("./train/subject_train.txt")
head(subject_train) #Seems to be all of 1's observations are first, followed by 2, all the way to subject 30
tail(subject_train)

subject_test <- read.table("./test/subject_test.txt")
head(subject_test) #Test subjects seem to be different for each dataset
tail(subject_test)

#Make tidy names

names(subject_train) <- "subject_id"
names(subject_test) <- "subject_id"

#sum(table(unique(subject_train[,1]))) + sum(table(unique(subject_test[,1]))) ## This shoud equal to 30

#help(package = "dplyr")
count(unique(subject_test)) + count(unique(subject_train)) #Confirms that there are 30 subjects

#Make the complete dataset

train <- cbind(subject_train,trainy,trainx) #This creates one data set
test <- cbind(subject_test,testy,testx) #This creates one date set
#Complete data set
all <- rbind(train,test) #This is the full combination of both data sets

#This just the measurements on the mean and standard deviation
sub_train <- cbind(subject_train, trainy,subtrainx)
sub_test <- cbind(subject_test,testy,subtestx)

dim(sub_train)
head(sub_train)
head(sub_test)
#This makes the complete data set
sub_all <- rbind(sub_train,sub_test)


#This is for descriptive activity names, from the activities data set
sub_all$act_id <- factor(sub_all$act_id, levels = activity_labels[,1],labels = act_labels)
sub_all$subject_id <- as.factor(sub_all$subject_id)


sub_all <- sub_all[order(sub_all$subject_id),] #This created the subset combination (mean, and standard deviation for each measurement)
sub_all[500:550,]


#This creates the independent tidy data set, with the mean as an aggregating varibale for each subject and activity
sub_all_melt <- melt(sub_all, id= c("subject_id","act_id"))
sub_all_melt_mean <- dcast(sub_all_melt, subject_id + act_id ~ variable,mean)

setwd("..")

write.table(sub_all_melt_mean,"tidy.txt",quote=FALSE,row.names=FALSE)

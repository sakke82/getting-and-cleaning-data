library(dplyr)
# Reading data from files.

trainX <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", sep='')
trainY <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt", sep='')
subject_train <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", sep='')
testX <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", sep='')
testY <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt", sep='')
subject_test <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", sep='')
feat <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", sep=' ')
labels <- read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", sep='')

# reading column names, and selecting only columns with 'mean' or 'std' in the name

colnames(trainX) <- make.names(feat$V2, unique=TRUE)
colnames(testX) <- make.names(feat$V2, unique=TRUE)

train_mean <- select(trainX,contains('mean'))
train_std <- select(trainX,contains('std'))
trainX <- cbind(train_mean,train_std)

test_mean <- select(testX,contains('mean'))
test_std <- select(testX,contains('std'))
testX <- cbind(test_mean,test_std)

# naming activity and subject columns

trainY <- rename(trainY, activity = V1)
subject_train <- rename(subject_train, subject = V1)
testY <- rename(testY, activity = V1)
subject_test <- rename(subject_test, subject = V1)

# binding data together

train <- cbind(trainY, subject_train, trainX)
test <- cbind(testY, subject_test, testX)

data <- rbind(train,test)

# changing activity column to factor, with levels taken from labels

data$activity <- factor(data$activity)
levels(data$activity) <- labels$V2

# removing all unnecessarry data frames

rm(train,trainX,trainY,test,testX,testY,feat,train_mean,train_std,test_mean,test_std,labels, subject_test, subject_train)

# group data by activity and subject, saving it to a df means, and calculates column means for each group

means <- group_by(data, activity, subject)
means <- summarise_each(means, funs(mean))

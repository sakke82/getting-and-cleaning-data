---
title: "Getting and cleaning data, course project"
author: "Sakari Hakala"
date: "Thursday, January 22, 2015"
output: html_document
---

This is a read me file for Coursera's Getting and cleaning data course project. Detailed description about data is available at 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, and data is at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

R script **run_analysis.R**:  
* load library **dplyr**  
* read data files from "./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset"  
* add column names from features.txt to data frame obtained from trainX.txt and testX.txt  
* for these df's select only those columns where recur word 'mean' or 'std'  
* rename df column names for trainY and testY as activity  
* rename df column names for subject_train and subject_test as subject  
* column bind df's trainY, subject_train and trainX for df train, and do same for test set  
* row bind df's train and test to obtain df data  
* change df data's first column to factor, with levels from activity_labels.txt   
* now df data is tidy data frame ready for work  
* at this stage, script removes all the unnecessary data frames from environment  
* to create new, seperate df from data, it splits data according variables activity and subject, creating df means  
* calculate column means for each numeric variables  
* script end here, leaving two clean data frames in the environment, called data and means  


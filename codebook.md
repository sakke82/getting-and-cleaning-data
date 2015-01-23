---
title: "Code Book"
author: "Sakari Hakala"
date: "Friday, January 23, 2015"
output: html_document
---

This is a codebook for getting and cleaning data course project.

Original source of data is here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 


**Variables**:   
* Activity : factor variable, from files trainY.txt and testY.txt, level names from activity_labels.txt   
     + levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  
* Subject : factor variable, from files subject_train.txt and subject_test.txt  
     + levels: 1,2,3,4, ... , 29,30    
* rest 86 variables were obtained from files trainX.txt and trainY.txt, column names from features.txt. Selected only ones with 'mean' or 'std' in the name.   


For detailed information about these variables can be read from files README.txt and features_info.txt, which are included to the original data package.

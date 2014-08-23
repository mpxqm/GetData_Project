#!/usr/bin/env Rscript

#######################################################################################################
#
# Getting and Cleaning Data
# Project - UCI HAR Dataset
#
# run_analysis.R
#
#######################################################################################################

#######################################################################################################
## directory locations
#######################################################################################################

# set working directory
working_dir = '~/Copy/Coursera/GettingAndCleaningData/GetData_Project/'
setwd(working_dir)

# data parent directory
data_parent_dir = '../UCI HAR Dataset/'
#######################################################################################################

#######################################################################################################
## detect column number and name of features related to mean and standard deviation of a measurement
#######################################################################################################

# load raw features information into a data frame
features = read.csv(paste(data_parent_dir,'features.txt',sep='/'), header=FALSE, as.is=TRUE, sep='')
colnames(features) = c('Column.Number','Feature.Name')

# use regular expression to detect features containing 'mean' or 'std'
mean_std_features_v = grepl('.*(mean)|(std)\\(\\).*',features[,'Feature.Name'])

# column numbers of mean and std features
mean_std_features_cols = features[mean_std_features_v,'Column.Number']

# creat tidy names for mean and std features
# '-' becomes '.'
# '()' becomes ''
mean_std_features_tidy_names =features[mean_std_features_v,'Feature.Name']
mean_std_features_tidy_names = gsub('-', '\\.', mean_std_features_tidy_names)
mean_std_features_tidy_names = gsub('\\(\\)', '', mean_std_features_tidy_names)
#######################################################################################################

#######################################################################################################
## load activity labels
#######################################################################################################
activity_labels = read.csv(paste(data_parent_dir,'activity_labels.txt',sep='/'), header=FALSE, as.is=TRUE, sep='')
colnames(activity_labels) = c('Activity.ID','Activity.Name')
#######################################################################################################

#######################################################################################################
## combine train and test X data
#######################################################################################################
data_X_train = read.csv(paste(data_parent_dir, 'train/X_train.txt', sep='/'), header=FALSE, colClasses='numeric', sep='')
data_X_test  = read.csv(paste(data_parent_dir,   'test/X_test.txt', sep='/'), header=FALSE, colClasses='numeric', sep='')

# only keep the mean and std features
data_X_train_mean_std = data_X_train[,mean_std_features_cols]
data_X_test_mean_std  =  data_X_test[,mean_std_features_cols]

# combine train and test X data
data_X_mean_std = rbind(data_X_train_mean_std, data_X_test_mean_std)

# assign feature column names
colnames(data_X_mean_std) = mean_std_features_tidy_names
#######################################################################################################

#######################################################################################################
## load train and test Y data
#######################################################################################################
data_Y_train = read.csv(paste(data_parent_dir, 'train/Y_train.txt', sep='/'), header=FALSE, col.names = c('Activity.ID'), colClasses='numeric', sep='')
data_Y_test  = read.csv(paste(data_parent_dir,   'test/Y_test.txt', sep='/'), header=FALSE, col.names = c('Activity.ID'), colClasses='numeric', sep='')

# combine train and test Y data
data_Y = rbind(data_Y_train, data_Y_test)

# convert Y data to activity_labels
data_Y$Activity = activity_labels[ data_Y[,'Activity.ID'], 'Activity.Name']
#######################################################################################################

#######################################################################################################
## load subject numbers
#######################################################################################################
data_subject_train = read.csv(paste(data_parent_dir, 'train/subject_train.txt', sep='/'), header=FALSE, col.names = c('Subject'), colClasses='numeric', sep='')
data_subject_test  = read.csv(paste(data_parent_dir,   'test/subject_test.txt', sep='/'), header=FALSE, col.names = c('Subject'), colClasses='numeric', sep='')

# combine train and test subject data
data_subject = rbind(data_subject_train, data_subject_test)
#######################################################################################################

#######################################################################################################
## create and save tidy data of mean and std
#######################################################################################################
data_tidy = cbind(Subject=data_subject[,'Subject'], Activity=data_Y[,'Activity'], data_X_mean_std)

# write tidy data to a comma separated variable text file (.txt) that Coursera accepts for upload
write.table(data_tidy, file='tidy.txt', quote = FALSE, row.names=FALSE, sep=',')
#######################################################################################################

#######################################################################################################
## create and save aggregated mean values of data_tidy features by subject and activity
#######################################################################################################
data_tidy_aggregated = aggregate(. ~ Subject + Activity, data = data_tidy, mean)

# write aggregated tidy data to a comma separated variable text file (.txt) that Coursera accepts for upload
write.table(data_tidy_aggregated, file='tidy_aggregated.txt', quote = FALSE, row.names=FALSE, sep=',')
#######################################################################################################

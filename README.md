GetData_Project: README.md
==========================

Project for Johns Hopkins University Coursera course Getting and Cleaning Data in the Data Science specialization

#### Project Purpose

Demonstrate ability to collect, work with, and clean a data set. The employed data set comes from the Human Activity Recognition Using Smartphones Dataset and is available for download at: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

#### Project Files

##### run_analysis.R
To use the [run_analysis.R](run_analysis.R) script you should first download the smartphone data. Second, update the variables <code>working_dir</code> and <code>data_parent_dir</code> in the script. Running the script may take a few minutes. It will load the orginal data and create new text files of tidy comma separated variable (CSV) data. The text files are named [tidy.txt](tidy.txt) and [tidy_aggregated.txt](tidy_aggregated.txt) (described briefly below).

##### tidy.txt
This tidy data set includes 10,299 rows and 81 columns. It combines the original available train and test data for all subjects and all measurements related to mean and std (standard deviation). For more details, see [CodeBook.md](CodeBook.md). Example R commands to load tidy.txt.

     working_dir = '~/Copy/Coursera/GettingAndCleaningData/GetData_Project/'
     setwd(working_dir)
     tidy_data = read.csv('tidy.txt')

##### tidy_aggregated.txt
This aggregated tidy data set includes 180 rows and 81 columns. It aggregates the mean of each feature for each activity and each subject. For more details, see [CodeBook.md](CodeBook.md).Example R commands to load tidy.txt.

     working_dir = '~/Copy/Coursera/GettingAndCleaningData/GetData_Project/'
     setwd(working_dir)
     tidy_data_aggregated = read.csv('tidy_aggregated.txt')

##### CodeBook.md
Describes the data, variables and transformations performed to clean up the data.

##### LICENSE
MIT license allowing use of these files without restriction

##### ATTRIBUTION
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
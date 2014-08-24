GetData_Project: CodeBook.md
============================

Project for Johns Hopkins University Coursera course Getting and Cleaning Data in the Data Science specialization


Tidy Data Files
==========
##### tidy.txt
* 10,299 rows and 81 columns

##### tidy_aggregated.txt
* 180 rows and 81 columns
* Aggregates the mean of each feature for each activity and each subject

##### Variables stored in tidy.txt and tidy_aggregated.txt
* column 1 : "Subject" : Subject ID number for 30 subjects (1-30)
* column 2 : "Activity" : Factor variable with six levels representing the physical activity performed by the subject during the measurement. Values include:
	* WALKING
	* WALKING_UPSTAIRS
	* WALKING_DOWNSTAIRS
	* SITTING
	* STANDING
	* LAYING 
* columns 3-81 : Quantified "mean" and "std" features (described below) named with the pattern [t|f][description].[mean|std] optionally followed by .[X|Y|Z], e.g. <code>tBodyGyroJerk.mean.X</code> or <code>fBodyBodyGyroMag.mean</code>
	* t and f stand for time domain and frequency domain respectively
	* mean and std stand for average and standard deviation respectively
	* X, Y and Z represent Cartesian directions of the accelerometer coordinate frame

Transformations from Original to Tidy Data
==========================================
The following transformation were applied to the original data

1.  applied regular expression <code>'.*(mean)|(std)\\(\\).*'</code> to detect and keep features containing 'mean' or 'std'
2.  <code>'-'</code> character in feature names substituted with a period <code>'.'</code>
3.  <code>'()'</code> character pattern substituted with empty string <code>''</code>
4.  Numeric Activity labels converted to character labels according to:
	* 1 -> WALKING
	* 2 -> WALKING_UPSTAIRS
	* 3 -> WALKING_DOWNSTAIRS
	* 4 -> SITTING
	* 5 -> STANDING
	* 6 -> LAYING	
5.  Subject column named "Subject"
6.  Activity column named "Activity"
7.  Row combined train and test data
8.  Column combined Subject, Activty and Feature columns
7.  Write [tidy.txt](tidy.txt)
8.  Aggregate by "Subject" and "Activity" and write [tidy_aggregated.txt](tidy_aggregated.txt)
	
Features
========
Features are signed floating point numbers (as text) normalized and bounded within [-1,1].

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.





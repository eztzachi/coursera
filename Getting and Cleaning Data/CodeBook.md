**Code Book**
============================
This is a description of variables involved in the tidy data. Each variable has a stated: type, possible values, and definition.

----------

How were the feature variavles obtained
------------
> **Note:**
> The following description of the data variables is based on the features_info.txt file, which is part of the [raw data](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip).

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing the frequency domain signals. 

How was the tidy data created
------------
 1. The training and the test sets were merged to create one data set. Matching variable features were added to describe the columns.
 2. Only the measurements containing the mean or the standard deviation were selected (feature name should contain either the "mean()" or "std()" substrings), plus the subject\_id and a number representing the activity\_type. 
 3. Activity types numbers were replaced with factors in order to create descriptive activity names.
 4. A set of `gsub` commands was performed in order to beautify the variable names, and make them legal CamelCase.
 5. A tidy data set was created by averaging each of the variables for each activity and each subject.
 6. The tidy data was saved to a text file.

Full variable description
------------
 - subject_id
	 - Integer variable between 1-30
	 - Unique identifier for a subject in the experiment 
 - activity_type
	 - Factor variable: WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING
	 - Unique activity identifier
 - timeBodyAcc\_mean_x/y/z
	 - Double variable
	 - Mean of the body acceleration time domain signal over the x/y/z axis, measured by accelerometer
 - timeBodyAcc\_std_x/y/z
	 - Double variable
	 - Standard deviation of the body acceleration time domain signal over the x/y/z axis, measured by accelerometer
 - timeGravityAcc\_mean_x/y/z
	 - Double variable
	 - Mean of the gravity acceleration time domain signal over the x/y/z axis, measured by accelerometer
 - timeGravityAcc\_std_x/y/z
	 - Double variable
	 - Standard deviation of the gravity acceleration time domain signal over the x/y/z axis, measured by accelerometer
 - timeBodyAccJerk\_mean_x/y/z
	 - Double variable
	 - Mean of the body acceleration time domain jerk signal over the x/y/z axis, measured by accelerometer
 - timeBodyAccJerk\_std_x/y/z
	 - Double variable
	 - Standard deviation of the body acceleration time domain jerk signal over the x/y/z axis, measured by accelerometer
 - timeBodyGyro\_mean_x/y/z
	 - Double variable
	 - Mean of the body acceleration time domain jerk signal over the x/y/z axis, measured by gyroscope
 - timeBodyGyro\_std_x/y/z
	 - Double variable
	 - Standard deviation of the body acceleration time domain jerk signal over the x/y/z axis, measured by gyroscope
 - timeBodyGyroJerk\_mean_x/y/z
	 - Double variable
	 - Mean of the body acceleration time domain jerk signal over the x/y/z axis, measured by gyroscope 
 - timeBodyGyroJerk\_std_x/y/z
	 - Double variable
	 - Standard deviation of the body acceleration time domain jerk signal over the x/y/z axis, measured by gyroscope 
 - timeBodyAccMag_mean
	 - Double variable
	 - Mean of the magnitude of the body acceleration time domain over the 3 dimensions  as measured by accelerometer
 - timeBodyAccMag_std
	 - Double variable
	 - Standard deviation of the magnitude of the body acceleration time domain over the 3 dimensions as measured by accelerometer
 - timeGravityAccMag_mean
	 - Double variable
	 - Mean of the magnitude of the gravity acceleration time domain over the 3 dimensions as measured by accelerometer
 - timeGravityAccMag_std
	 - Double variable
	 - Standard deviation of the magnitude of the gravity acceleration time domain over the 3 dimensions as measured by accelerometer
 - timeBodyAccJerkMag_mean
	 - Double variable
	 - Mean of the magnitude of the body acceleration time domain jerk signal over the 3 dimensions as measured by accelerometer
 - timeBodyAccJerkMag_std
	 - Double variable
	 - Standard deviation of the magnitude of the body acceleration time domain jerk signal over the 3 dimensions as measured by accelerometer
 - timeBodyGyroMag_mean
	 - Double variable
	 - Mean of the magnitude of the body acceleration time domain over the 3 dimensions  as measured by gyroscope
 - timeBodyGyroMag_std
 	 - Double variable
	 - Standard deviation of the magnitude of the body acceleration time domain over the 3 dimensions  as measured by gyroscope 
 - timeBodyGyroJerkMag_mean
	 - Double variable
	 - Mean of the magnitude of the body acceleration time domain jerk signal over the 3 dimensions as measured by gyroscope
 - timeBodyGyroJerkMag_std
 	 - Double variable
	 - Standard deviation of the magnitude of the body acceleration time domain jerk signal over the 3 dimensions as measured by gyroscope
 - frequencyBodyAcc\_mean_x/y/z
	 - Double variable
	 - Mean of the body acceleration frequency domain signal over the x/y/z axis, measured by accelerometer
 - frequencyBodyAcc\_std_x/y/z
	 - Double variable
	 - Standard deviation of the body acceleration frequency domain signal over the x/y/z axis, measured by accelerometer
 - frequencyBodyAccJerk\_mean_x/y/z
 	 - Double variable
	 - Mean of the body acceleration frequency domain jerk signal over the x/y/z axis, measured by accelerometer
 - frequencyBodyAccJerk\_std_x/y/z
 	 - Double variable
	 - Standard deviation of the body acceleration frequency domain jerk signal over the x/y/z axis, measured by accelerometer
 - frequencyBodyGyro\_mean_x/y/z
	 - Double variable
	 - Mean of the body acceleration frequency domain jerk signal over the x/y/z axis, measured by gyroscope
 - frequencyBodyGyro\_std_x/y/z
 	 - Double variable
	 - Standard deviation of the body acceleration frequency domain jerk signal over the x/y/z axis, measured by gyroscope
 - frequencyBodyAccMag_mean
	 - Double variable
	 - Mean of the magnitude of the body acceleration frequency domain over the 3 dimensions  as measured by accelerometer
 - frequencyBodyAccMag_std
	 - Double variable
	 - Standard deviation of the magnitude of the body acceleration frequency domain over the 3 dimensions  as measured by accelerometer
 - frequencyBodyAccJerkMag_mean
	 - Double variable
	 - Mean of the magnitude of the body acceleration frequency domain jerk signal over the 3 dimensions as measured by accelerometer
 - frequencyBodyAccJerkMag_std
	 - Double variable
	 - Standard deviation of the magnitude of the body acceleration frequency domain jerk signal over the 3 dimensions as measured by accelerometer
 - frequencyBodyGyroMag_mean
	 - Double variable
	 - Mean of the magnitude of the body acceleration frequency domain over the 3 dimensions  as measured by gyroscope
 - frequencyBodyGyroMag_std
	 - Double variable
	 - Standard deviation of the magnitude of the body acceleration frequency domain over the 3 dimensions  as measured by gyroscope
 - frequencyBodyGyroJerkMag_mean
	 - Double variable
	 - Mean of the magnitude of the body acceleration frequency domain jerk signal over the 3 dimensions as measured by gyroscope
 - frequencyBodyGyroJerkMag_std
 	 - Double variable
	 - Standard deviation of the magnitude of the body acceleration frequency domain jerk signal over the 3 dimensions as measured by gyroscope

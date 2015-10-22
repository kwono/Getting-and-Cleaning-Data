# Explanation of the variables

**subject:**
>the subject who performed each activity, range from 1 to 30.
	
**activity:**
>the activity that each subject performed: laying, sitting, standing, walking, walking downstairs, walking upstairs.


**tAcc-XYZ and tGyro-XYZ:**
>represent the accelerometer and gyroscope 3-axial raw signals. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

**tBodyAcc-XYZ and tGravityAcc-XYZ:**
>the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

**tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ:**
>the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. 

**tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag:**
>the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 

**fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag:**
>a Fast Fourier Transform (FFT) was applied to some of these signals. Note the 'f' to indicate frequency domain signals. 

----
These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation

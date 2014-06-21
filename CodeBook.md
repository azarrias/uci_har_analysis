## Overview

- The script [run_analysis.R](run_analysis.R) script on this repo creates a tidy data set (more details provided on the [README.md](README.md) file)
- This Code Book describes the variables, the data, and any transformations or work performed to clean up the data from the source to this resulting tidy data set

## Source data - Taken from the original study (1)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### The dataset includes the following files:

- `README.txt`
- `features_info.txt`: Shows information about the variables used on the feature vector.
- `features.txt`: List of all features.
- `activity_labels.txt`: Links the class labels with their activity name.
- `train/X_train.txt`: Training set.
- `train/y_train.txt`: Training labels.
- `test/X_test.txt`: Test set.
- `test/y_test.txt`: Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

### Source data set features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 


## Data Transformations performed by the R script [run_analysis.R](run_analysis.R)

The main objectives of the R script are described in the Outline section of the [README.md](README.md) file. These are the transformations on the data flow from the source to the final tidy data set:

1. First step checks that all necessary source files are present in the expected path, as specified in the Prerequisites section of the [README.md](README.md) file. If any file is not present, the script interrupts its execution.
2. Read test and train data sets, sub-setting to keep only the columns we are interested in (see later Data Set Columns section)
3. Merge both test and train data sets
4. Merge the resulting data set with the activity labels, to substitute the activity IDs with descriptive activity names
5. Label data set columns with descriptive names (see later Data Set Columns section)
6. Create independent tidy data set with the average of each of the columns / features for each activity and subject using the `reshape2` package
7. Write the tidy data set to disk, as a txt file named `tidyDataSet.txt` with the default separator (space character " ") and the headers described in the following Data Set Columns section - this step overwrites any already existing file with the same name


## Data Set Columns

One of the main goals of the tidy data set is that it had to contain only the mean and standard deviation variables that were estimated from the signals that were measured for the original study (1)
The following columns / variables have been included in the resulting tidy data set:

1. `activity_name`: Activity that the person was performing when the measures were taken (i.e. WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING)
2. `subject_id`: Numeric ID for the person carrying the smartphone. The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years.

	The next columns (or variables), from number 3 on, give the mean value of the corresponding measures, for each activity and subject.
	Column names map easily with the original ones from the source data sets, which were taken from the `features.txt` file.
	For a detailed description on the meaning of these column names, please refer to the previous `Source data set features` section of this document, taking into account that the variables present here in the resulting tidy data set are just the mean of the source variables aggregated by activity and subject.

3. `t_body_acc_mean_x`
4. `t_body_acc_mean_y`
5. `t_body_acc_mean_z`
6. `t_body_acc_std_x`
7. `t_body_acc_std_y`
8. `t_body_acc_std_z`
9. `t_gravity_acc_mean_x`
10. `t_gravity_acc_mean_y`
11. `t_gravity_acc_mean_z` 
12. `t_gravity_acc_std_x`
13. `t_gravity_acc_std_y`
14. `t_gravity_acc_std_z`
15. `t_body_acc_jerk_mean_x`
16. `t_body_acc_jerk_mean_y`
17. `t_body_acc_jerk_mean_z`
18. `t_body_acc_jerk_std_x`
19. `t_body_acc_jerk_std_y`
20. `t_body_acc_jerk_std_z`
21. `t_body_gyro_mean_x`
22. `t_body_gyro_mean_y`
23. `t_body_gyro_mean_z`
24. `t_body_gyro_std_x`
25. `t_body_gyro_std_y`
26. `t_body_gyro_std_z`
27. `t_body_gyro_jerk_mean_x`
28. `t_body_gyro_jerk_mean_y`
29. `t_body_gyro_jerk_mean_z`
30. `t_body_gyro_jerk_std_x`
31. `t_body_gyro_jerk_std_y`
32. `t_body_gyro_jerk_std_z`
33. `t_body_acc_mag_mean` 
34. `t_body_acc_mag_std`
35. `t_gravity_acc_mag_mean`
36. `t_gravity_acc_mag_std`
37. `t_body_acc_jerk_mag_mean` 
38. `t_body_acc_jerk_mag_std`
39. `t_body_gyro_mag_mean`
40. `t_body_gyro_mag_std`
41. `t_body_gyro_jerk_mag_mean`
42. `t_body_gyro_jerk_mag_std`
43. `f_body_acc_mean_x`
44. `f_body_acc_mean_y`
45. `f_body_acc_mean_z` 
46. `f_body_acc_std_x`
47. `f_body_acc_std_y`
48. `f_body_acc_std_z`
49. `f_body_acc_jerk_mean_x`
50. `f_body_acc_jerk_mean_y`
51. `f_body_acc_jerk_mean_z`
52. `f_body_acc_jerk_std_x`
53. `f_body_acc_jerk_std_y`
54. `f_body_acc_jerk_std_z`
55. `f_body_gyro_mean_x`
56. `f_body_gyro_mean_y`
57. `f_body_gyro_mean_z`
58. `f_body_gyro_std_x`
59. `f_body_gyro_std_y`
60. `f_body_gyro_std_z`
61. `f_body_acc_mag_mean`
62. `f_body_acc_mag_std`
63. `f_body_body_acc_jerk_mag_mean`
64. `f_body_body_acc_jerk_mag_std`
65. `f_body_body_gyro_mag_mean`
66. `f_body_body_gyro_mag_std`
67. `f_body_body_gyro_jerk_mag_mean`
68. `f_body_body_gyro_jerk_mag_std`


(1) _Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012_

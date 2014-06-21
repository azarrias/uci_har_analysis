## Outline

The [run_analysis.R](run_analysis.R) script on this repo:
- Loads and merges into R the training and test data sets collected on the Samsung Galaxy S smartphone study(1) [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
- Creates a tidy data set with the average of each variable for each activity and each subject, so that:
	- Only the measurements on the mean and standard deviation are extracted from the source training and test data sets
	- The activities have a descriptive name, instead of an associated numeric ID
	- Gives descriptive names to the variables appropriately
	- It complies with the Tidy Data framework described on [this paper](http://vita.had.co.nz/papers/tidy-data.pdf) by Hadley Wickham.
	- [This code book](CodeBook.md) describes the variables, the data, and any transformations or work performed to clean up the data

	
## Prerequisites / How to use the [run_analysis.R](run_analysis.R) script

- Clone this repo
- Download the [source data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
	- Alternative location from the original study [website](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip)(1)
- Unzip this file creating the following tree structure:
	- `~/run_analysis.R`
	- `~/UCI HAR Dataset/activity_labels.txt`
	- `~/UCI HAR Dataset/features.txt`
	- `~/UCI HAR Dataset/features_info.txt`
	- `~/UCI HAR Dataset/README.txt`
	- `~/UCI HAR Dataset/test/subject_test.txt`
	- `~/UCI HAR Dataset/test/X_test.txt`
	- `~/UCI HAR Dataset/test/y_test.txt`
	- `~/UCI HAR Dataset/train/subject_train.txt`
	- `~/UCI HAR Dataset/train/X_train.txt`
	- `~/UCI HAR Dataset/train/y_train.txt`
- It's critical to have this tree file structure before running the script, otherwise it won't work as expected. There are some other files contained in the .zip file, but these are not used by the R script.
- Open the R console and change the working directory using the `setwd(dir)` command (type `?setwd` in case you need any help)
- Load the script: `source("run_analysis.R")`
- Run the analysis function: `run_analysis()`
	- The package `reshape2` is required by the script, so the user may be prompt to download it in case it is not already present in the system
- A tidy data set will be created in the working directory with the name `tidyDataSet.txt`	

	
(1) _Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012_

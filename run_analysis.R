run_analysis <- function() {

mainDir <- "UCI HAR Dataset"
testSubDir <- "test"
trainSubDir <- "train"

# Check that all files within fileNameVector are present in the filePath
# If not, raise an error and interrupt the execution
checkFiles <- function(fileNameVector, filePath) {
	dummyList <- lapply(fileNameVector, function(x){ 
		if(!file.exists(paste(filePath, x, sep = "/"))) 
			stop(paste("File", x, "is not inside the", filePath, "directory"))
	})
}

# Read files within test and train subfolders
# Returns the Data Frame
readFiles <- function(fileNameSuffix) {
	# Read subject_ txt file
	filePath <- file.path(mainDir, fileNameSuffix, paste0("subject_", fileNameSuffix, ".txt"))
	subject <- read.table(filePath, header = F, colClasses = "integer", col.names = "subjectId")

	# Read y_ txt file
	filePath <- file.path(mainDir, fileNameSuffix, paste0("y_", fileNameSuffix, ".txt"))
	activity <- read.table(filePath, header = F, colClasses = "integer", col.names = "activityId")

	# Read X_ txt file and column names from features.txt
	filePath <- file.path(mainDir, fileNameSuffix, paste0("X_", fileNameSuffix, ".txt"))
	myDataFrame <- read.table(filePath, header = F, comment.char = "", colClasses = "numeric")
	names(myDataFrame) <- read.table(file.path(mainDir, "features.txt"), header = F, as.is = T,
		colClasses = c("NULL", "character"), col.names = c("ID", "FeatureName"))[,1]

	# Grab only measurements on the mean and standard deviation
	colSubset <- grep(".*mean\\(\\)|.*std\\(\\)", names(myDataFrame))
	myDataFrame <- myDataFrame[,colSubset]

	# Append SubjectID and ActivityID
	myDataFrame <- cbind(subject, activity, myDataFrame)

	return (myDataFrame)
}

# Loads an R package, or tries to install it if it's not present
loadPackage <- function(packageName) {
  packageName <- as.character(substitute(packageName))
  if(isTRUE(packageName %in% .packages(all.available=TRUE))) {
    eval(parse(text=paste("require(", packageName, ")", sep="")))
  } else {
    # to update dependencies to the latest version
    #update.packages()
    eval(parse(text=paste("install.packages('", packageName, "')", sep="")))
    eval(parse(text=paste("require(", packageName, ")", sep="")))
  }
} 

# Check that all necessary source files are available
checkFiles(c("activity_labels.txt", "features.txt", "features_info.txt"), mainDir)
checkFiles(c("subject_test.txt", "X_test.txt", "y_test.txt"), file.path(mainDir, testSubDir))
checkFiles(c("subject_train.txt", "X_train.txt", "y_train.txt"), file.path(mainDir, trainSubDir))

# Read test data set
testDataSet <- readFiles ("test")

# Read train data set
trainDataSet <- readFiles ("train")

# Merge training and test sets to create one data set
myDataFrame <- rbind(testDataSet, trainDataSet)

# Use descriptive activity names to name the activities in the data set
activityLabels <- read.table(file.path(mainDir, "activity_labels.txt"), header=F, as.is=T, 
	col.names=c("activityId", "activityName"))
myDataFrame <- merge(activityLabels, myDataFrame, all=T)
myDataFrame <- myDataFrame[,!(names(myDataFrame)=="activityId")]

# Label the data set with descriptive variable names
names(myDataFrame) <- gsub("([[:upper:]])", "_\\L\\1", names(myDataFrame), perl=TRUE)
names(myDataFrame) <- gsub("\\(\\)-?", "", names(myDataFrame))
names(myDataFrame) <- gsub("-", "_", names(myDataFrame))

# Creates an independent tidy data set with the average of each variable for each activity and subject
loadPackage("reshape2")
meltDataFrame <- melt(myDataFrame, id = c("subject_id", "activity_name"))
tidyDataSet <- dcast(meltDataFrame, activity_name + subject_id ~ variable, mean)

# Write tidy data set to disk
write.table(tidyDataSet, "tidyDataSet.txt", row.names = FALSE)
}
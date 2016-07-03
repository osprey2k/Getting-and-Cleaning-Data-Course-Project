Author:	osprey2k
Date:	7/2/2016

Purpose:
	Description of the Coursera "Getting and Cleaning Data" Course Project

	The files listed in the RawData.zip folder were downloaded from this site:
		https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

	Included in the above downloaded file are data collected for an experiment involving 30 volunteers using accelerometers from the Samsung Galaxy S II
	smartphone engaged in six activities.  

	Description of Files:
	-----------------------------------------------------------------------------------------------------------------
		X_test.txt: 		measurements captured for subjects partitioned into "test" set
		Y_test.txt: 		activity identifiers for each row in X_text.txt
		subject_test.txt:	subject identifiers for each row in X_test.txt
		X_training.txt:		measurements captured for subjects partitioned into "training" set
		Y_training.txt:		activity identifiers for each row in X_training.txt
		subject_train.txt:	subject identifiers for each row in X_training.txt
		features.txt:		labels for the measured variables in X_test.txt and X_training.txt files
		activity_labels.txt:	description of activity performed; is a "lookup" to Y_test.txt and Y_training.txt
		
	Process:
	-----------------------------------------------------------------------------------------------------------------
	The code to create FinalDataSet.txt works as follows:
		Section 1:	Imports the data needed for the project in "fileURL" variable and stores in a 
				directory specified by "savePath" and "saveFile" variables.
				The imported zip file is then unzipped and contents saved in the "SavePath" folder.
		Section 2:	Imports the data, labels, and subjects for the training/test sets.
				Also imports the header names (features dataset) and the activity labels for the data.
		Section 3:	Updates the data to use the headers names (features dataset) and add the subject and
				activity variables to the data.
		Section 4:	Merges the train_data and the test_data data frames, subsets to relevant variables,
				and add descriptive activity names.
		Section 5:	Creates a dataset with an average of each variable for every activity and subject
				and exports resulting final dataset
		
		
	 

	

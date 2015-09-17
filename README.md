# run_analysis
R training on Coursera data scientist course

The task was as follows:
"You should create one R script called run_analysis.R that does the following. 
  1.Merges the training and the test sets to create one data set.
  2.Extracts only the measurements on the mean and standard deviation for each measurement. 
  3.Uses descriptive activity names to name the activities in the data set
  4.Appropriately labels the data set with descriptive variable names. 
  5.From the data set in step 4, creates a second, independent tidy data set with the 
    average of each variable for each activity and each subject."

There are two datasets (training ("train") and test ("test").    
The code imports the 2 dataset, the activity labels for the records in the datasets and the, subject labels in the datasets.
The datasets are bound together (eg, train on top of test). The same is done with the activity labels and the subject labels.

The headers for the datasets are then imported and applied to the names of the columns.
The columns with the words "mean" and "std" are then selected

The activity labels are then joined to their descriptions. Then this output is joined to the the subject labels and the main dataset.

The total dataset is then turned into a new, tidy dataset, and the variable field is filtered for the word "mean"

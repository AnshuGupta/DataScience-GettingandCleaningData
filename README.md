DataScience-GettingandCleaningData
==================================

Getting an Cleaning Data

Data can be cleaned and analyzed by running run_analysis.R file. 
To execute run_analysis.R script, make sure that data directory UCI HAR Dataset is in your working directory
Script creates 2 output files:
clean_data.txt : tidy data without analysis i.e complete clean data set
final_analyzed_data.txt : analyzed data where the dataset comprises of mean for each subject of each activity.

Steps that are carried out by run_analysis.R file
=================================================

1. Change working directory to UCI HAR Dataset. Assuming that directory "UCI HAR Dataset" is in your working directory.
2. Read activity_labels.txt and features from directory UCI HAR Dataset
3. Change working directory to UCI HAR Dataset/train 
4. Read Training Data from directory : UCI HAR Dataset/train. Read files X_train.txt, y_train.txt,subject_train.txt
5. Change working directory to UCI HAR Dataset/test. Read Test data from directory : UCI HAR Dataset/test
6. Read files X_test.txt,y_test.txt,subject_test.txt
7. Combine y_train and subject_train data
8. Combine y_test and subject_test data
9. Rename columns of dataframes y_train_data and y_test_data to "Activity" and "Subject"
10. Combine training and test data of y
11.Combine  training and test data of X
12.Change column names of X_train_test from features.txt
13.Eliminate columns from X_train_test which do not have "mean()" or "std()" in the column names
14.Get column index of columns with "mean()" in column names
15.Get column index of columns with "std()" in column names
16.subset data from X_train_test data frame having mean()/std() in column names
17.Combine training + test data of X and y - X_train_test,y_train_test
18. Create a output file with clean and tidy data
19.Rearrange dataframe to reorder columns
20. Write clean data to txt file.      
21. Take mean of observations per activity per subject.To take mean, melt X_y_training_test dataframe
22 Calculate mean of observations per activity per subject
23 Replace activity numbers with Activity names from activity_lables.txt       
24. Rearrange dataframe to reorder columns
25. output analysed data to txt file       


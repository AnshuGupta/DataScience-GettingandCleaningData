#Change directory to UCI HAR Dataset
setwd("C:/Users/Anshu/Documents/study/R/getting_cleaning_data/UCI HAR Dataset")
#Read Activity labels and features from directory UCI HAR Dataset
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

#Read Training Data from directory : UCI HAR Dataset/train 
setwd("UCI HAR Dataset/train")
#Read files X_train,y_train
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

#Read Test data from directory : UCI HAR Dataset/test
setwd("C:/Users/Anshu/Documents/study/R/getting_cleaning_data/UCI HAR Dataset/test")
#Read files X_test,y_test
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")


#Combine dataframes y_train and subject_train
y_train_data <- cbind(y_train,subject_train)

#Combine dataframes y_test and subject_test
y_test_data <- cbind(y_test,subject_test)

#Rename columns of dataframes y_train_data and y_test_data
names(y_train_data)[c(1)]<-c("Activity")
names(y_train_data)[c(2)]<-c("Subject")
names(y_test_data)[c(1)]<-c("Activity")
names(y_test_data)[c(2)]<-c("Subject")

#Combine training and test data of y
y_train_test<- rbind(y_train_data,y_test_data)

#Combine  training and test data of X
X_train_test <- rbind(X_train,X_test)

#Change column names of X_train_test from features.txt
i = 1
while (i<ncol(X_train_test+1)){  
  names(X_train_test)[c(i)] <- c(as.character(features[i,2]))
  i = i+1  
}
  
#Eliminate columns from X_train_test which do not have "mean()" or "std()" in the column names
#Get column index of columns with "mean()" in column names
column_name_mean_index <- grep('-mean()', colnames(X_train_test),fixed=TRUE)    

#Get column index of columns with "std()" in column names
column_name_std_index <- grep('-std()', colnames(X_train_test),fixed=TRUE) 
       
#subset data from X_train_test data frame having mean()/std() in column names
X_train_test <- subset(X_train_test,select=c(column_name_mean_index,column_name_std_index))

#Combine training + test data of X and y - X_train_test,y_train_test
X_y_training_test <- cbind(y_train_test,X_train_test)

#Create a output file with clean and tidy data
clean_data <- merge(X_y_training_test,activity_labels,by.x="Activity",by.y="V1",all=TRUE)
#Rearrange dataframe to reorder columns
clean_data <- clean_data[,c(69,2:68)]

#output analysed data to txt file       
write.table(clean_data,file="clean_data.txt")

# Analyze data

#Take mean of observations per activity per subject
#To take mean, melt X_y_training_test dataframe
dataMelt <- melt(X_y_training_test,id=c("Activity","Subject"),measure.vars=c(3:68))
#Calculate mean of observations per activity per subject
dataMean <- dcast(dataMelt,Activity+Subject~variable,mean)
       
# Replace activity numbers with Activity names from activity_lables.txt       
final <- merge(datamean,activity_labels,by.x="Activity",by.y="V1",all=TRUE)
#Rearrange dataframe to reorder columns
final <- final[,c(69,2:68)]

#output analysed data to txt file       
write.table(final,file="final_analyzed_data.txt")
       


install.packages("tidyverse")
library(tidyverse)
library(dplyr)

#I downloaded the file from Coursera
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#I downloaded the zip file 
download.file(destfile = "getdata_projectfiles_UCI HAR Dataset.zip",fileURL)
#I set the working the directory to Project-4
directory <- "C:/User/Danie/Desktop/John Hopkins University Data Science Certification/Project-4/
getdata_projectfiles_UCI HAR Dataset.zip"
#I unzip the the zip file
unzip(zipfile = "getdata_projectfiles_UCI HAR Dataset.zip", exdir = "./Project-4", overwrite = TRUE)
# I tried to find out if UCI data was in Project-4
list.dirs(recursive = TRUE)
# I wanted to see if Project-4/UCI data set was in the directory
file.exists("Project-4/UCI HAR Dataset")
# I wanted to read that data table and I set the colnames cause
# I was going to change them.
features <- read_table("./Project-4/UCI HAR Dataset/features.txt", col_names = FALSE)
#I wanted to see how many colomns where in features
ncol(features)
#I wanted to only change columns 1, and 2
features <- features[,c(1,2)]
#I wanted to change feature headers to Count, and Values
colnames(features) <- c("Count","Values")
# I used the read table function to load up Subject training Data
Subject <- read_table("./Project-4/UCI HAR Dataset/train/subject_train.txt",
                      col_names = FALSE)
# I wanted to look at the first column of Subject
Subject <- Subject[,(1)]
# I changed the header for column 1 to person ID
colnames(Subject) <- ("person ID")
# I loaded up Activity training using read_table function.
Activity <- read_table("./Project-4/UCI HAR Dataset/train/y_train.txt",
                               col_names = FALSE)
#I only wanted to look at column 1 of Activity.
Activity <- Activity[,(1)]
#I change the column 1 header to Activity.
colnames(Activity) <- ("Activity")

#I used read_table function to load up Measurements training data.
Measurements <- read_table("./Project-4/UCI HAR Dataset/train/X_train.txt",
                               col_names = FALSE)
#I used the features values to set that as the header names for Measurements.
colnames(Measurements)<- (features$Values)
#I used the cbind function to combine all three data sets because
#They all have the same number of columns.
Train_Data <- cbind(Subject, Activity, Measurements)

# I loaded subject_test  using read_table function
Subject_test <- read_table("./Project-4/UCI HAR Dataset/test/subject_test.txt",
                       col_names = FALSE)
# I only wanted to look at the first column
Subject_test <- Subject_test[,(1)]
# I changed the 1 column name to person ID.
colnames(Subject_test) <- ("person ID")
# I used the read_table function to get the Activity test data.
Activity_test <- read_table("./Project-4/UCI HAR Dataset/test/y_test.txt",
                        col_names = FALSE)
# I only wanted to look at the first column.
Activity_test <- Activity_test[,(1)]
# I changed the fist column header to Activity.
colnames(Activity_test)<- ("Activity")
# I used the read_table function to turn Measurements_test into a data table.
Measurements_test <- read_table("./Project-4/UCI HAR Dataset/test/X_test.txt",
                            col_names = FALSE)
# I used the feature values columnn to use that as the
# header name for Measurements_test.
colnames(Measurements_test) <- features$Values

# I used the cbind function to combine all data tables into one
# I used the cbind function because they all have the same number of 
# columns.
Test_Data <- cbind(Subject_test, Activity_test, Measurements_test)

# I used the rbind function because Train_Data, and Test_Data
# have the same number of rows.
Final_Data <- rbind(Train_Data,Test_Data)
# I used the grep function to find how many columns used the function
# mean() of std(). I also included columns 1 and 2 because I am going
# to use them later.
Final_Compare <- c(1, 2, grep("mean()|std()", names(Final_Data)))

# I used the read_table function to create a data table for labels.
Labels <- read_table("./Project-4/UCI HAR Dataset/activity_labels.txt",
                       col_names = FALSE)
# I only wanted to look at columns 1 and 2
Labels <- Labels[,c(1,2)]
# I changed the column names of 1 and 2.
colnames(Labels) <- c("Count","Action")
# I used Final_Data and Final_Compare to filter through the data.
Filtered_Data <- Final_Data[,Final_Compare]
# I merged Filtered_Data and Labels together using Activity and Count
# and set sort to false because it was going to reorder Activity.
MergeData <- merge(Filtered_Data,Labels, by.x = "Activity", by.y = "Count", sort = FALSE)
#I used the group_by function to group by person and Action.
Grouped <- group_by(MergeData, `person ID`, Action)
# Then I summarized all of Grouped data using it's average.
summary<-summarize_all(Grouped, mean)
#Then I printed the summary on the console.
summary
# Then I stored the summary data table into a txt file.
write.table(summary, "tidy_data.txt", row.names = FALSE)
# I also stored it in a csv file just to see how it would
#look like.
write.table(summary, "table_data.csv", row.names = FALSE)

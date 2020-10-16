# get the library for reading text files as data.frame
# library(data.table)

# 1.  read in labels to be used later for adding description to variables and observations
# read in activity labels

  activity_label<-read.table("UCI HAR Dataset/activity_labels.txt")
  names(activity_label)<-c("ActivityID","Activity")
  
# read in feature list
  
  features<-read.table("UCI HAR Dataset/features.txt")
  
# 2. Read In test data
  
  test_subjects<-read.table("UCI HAR Dataset/test/subject_test.txt")
  names(test_subjects)<-"SubjectID"
  
  test_set<-read.table("UCI HAR Dataset/test/X_test.txt")
  names(test_set)<-features$V2
  
  test_activities<-read.table("UCI HAR Dataset/test/Y_test.txt")
  names(test_activities)<-"ActivityID"
  
# 2.4 bind the test data set per observations
  
  test_data<-cbind(test_subjects,test_set,test_activities)

# 2.5 Take only columns that include the word mean, std and Subject.Id, Activity.Id
  
  test_sliced <<- test_data[grep("SubjectID|ActivityID|mean\\(\\)|std\\(\\)",colnames(test_data))]
  
# 2.6 Add descriptive activity names to the activities in the test data set
  final_test<-merge(test_sliced,activity_label,all=TRUE)

# 3. Read In training data  
  
  train_subjects<-read.table("UCI HAR Dataset/train/subject_train.txt")
  names(train_subjects)<-"SubjectsID"
  
  train_set<-read.table("UCI HAR Dataset/train/X_train.txt")
  names(train_set)<-features$V2
  
  train_activities<-read.table("UCI HAR Dataset/train/Y_train.txt")
  names(train_activities)<-"ActivityID"
  
# 3.4 bind the train data set per observations
  
  train_data<-cbind(train_subjects,train_set,train_activities)
  
# 3.5 Take only columns that include the word mean, std and Subject.Id, Activity.Id
  train_sliced <<- train_data[grepl("SubjectID|ActivityID|mean\\(\\)|std\\(\\)",colnames(train_data))]
  
# 3.6 Add descriptive activity names to the activities in the train data set
  final_train<-merge(train_sliced,activity_label,all=TRUE)
  
#  Merge test and train dataset
  
  dataset<-merge(final_test,final_train,all=TRUE)
  
  
#  Produce a tidy dataset with the average of each variable for each activity and each subject
 
   install.packages("reshape2")
   library(reshape2)
  
# First we melt the data set in order to produce a casted table on multiple columns later on.
# we melt the data set on all value conserving as ids (Subject.Id and Activity)

# take the column names which will be aggregated
  
  averagecol<-colnames(dataset[,2:67])
  
#melt the data
  
  m<-melt(dataset,id=c("SubjectID","Activity"),measure.vars = averagecol)
  
#now cast the melted data set to produce the tidy dataset
  
  tidy_data<-dcast(m,SubjectID + Activity ~ variable,mean)
  
# Finally write the tidy dataset to the Data folder
  
  write.table(tidy_data,file="tidydataset.txt",row.names = FALSE)

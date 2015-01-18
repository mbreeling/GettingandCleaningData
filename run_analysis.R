#Read the test data set, give descriptive variable names, and add activity and subject columns
library(dplyr)
read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")->xtst
read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")->ytst
read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")->stst
names(ytst)<-c("V562")
names(stst)<-c("V563")
cbind(xtst,ytst,stst)->dat
read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")->feat
ournames<-c(as.character(feat$V2),"activity","subject")
names(dat)<-ournames

#Do the same thing for the training data set, then rbind the test and training data frames
read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")->xtrn
read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")->ytrn
read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")->strn
names(ytrn)<-c("V562")
names(strn)<-c("V563")
cbind(xtrn,ytrn,strn)->dat2
names(dat2)<-ournames
rbind(dat,dat2)->df
tbl_df(df)->df

#Subset the data to just give columns with mean and std, as well as the activity and subject columns
c(grep("mean()",names(df),fixed=T),grep("std()",names(df),fixed=T),562,563)->ourIndex
df[,ourIndex]->df

#Give descriptive activity names, clean up descriptive variable names
read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")->actlbl
df$activity<-as.factor(df$activity)
levels(df$activity)<-actlbl$V2
gsub("[[:punct:]]", "", names(df))->names(df)

#Create second data set with means
df %>% group_by(activity,subject)%>% summarise_each(funs(mean)) -> tidydf
write.table(tidydf,"Tidy_UCI_HAR.txt",row.name=FALSE)
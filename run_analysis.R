### needs "plyr" package; make sure it is installed
### needs setInternet2(use=TRUE) for the download to work properly from https sites

setInternet2(use=TRUE)
file <- "data.zip"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data_path <- "UCI HAR Dataset"
result_folder <- "results"

library(plyr)

### Create data and folders   
# verifies the data zip file has been downloaded
if(!file.exists(file)){
    
    ###Downloads the data file
    print("downloading Data from https sites needs setInternet2(use=TRUE)")
    download.file(url, file, mode = "wb")
    
}
### create a separate "results" folder

if(!file.exists(result_folder)){
    print("Creating result folder")
    dir.create(result_folder)
} 

### Funtion to read a table from the zip file
getTable <- function (filename, cols = NULL){
    
    print(paste("Getting table - ", filename))
    
    f <- unz(file, paste(data_path, filename, sep="/"))
    
    data <- data.frame()
    
    if(is.null(cols)){
        data <- read.table(f, sep="", stringsAsFactors=F)
    } else {
        data <- read.table(f, sep="", stringsAsFactors=F, col.names= cols)
    }
    
    
    data
    
}

### Function getData reads and creates a complete data set
getData <- function(type, features){
    
    print(paste("Getting data", type))
    
    subject_data <- getTable(paste(type, "/", "subject_", type, ".txt", sep=""), "id")
    y_data <- getTable(paste(type,"/","y_",type,".txt",sep=""), "activity")    
    x_data <- getTable(paste(type,"/","X_",type,".txt",sep=""), features$V2) 
    
    return (cbind(subject_data, y_data, x_data)) 
}

###saves the data into the result folder
saveResult <- function (data, name){
    
    print(paste("Saving data", name))
    
    ###file <- paste(result_folder, "/", name,".csv" ,sep="") #use for writing csv files.
    
	file <- paste(result_folder, "/", name,".txt" , sep="")

    ###write.csv(data, file) #use for writing csv files

    write.table(data, file, quote = TRUE, sep = " ", eol = "\n", 
		na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")

}



### get common data tables
### use features for col names 
features <- getTable("features.txt")

### Load the data training and test data sets
train <- getData("train", features)
test <- getData("test", features)

### Merge the training and the test sets to create one data set

data <- rbind(train, test)

# rearrange the data using id
data <- arrange(data, id)


### Uses descriptive activity names to name the activities in the data set
### Appropriately labels the data set with descriptive activity names

activity_labels <- getTable("activity_labels.txt")

data$activity <- factor(data$activity, levels=activity_labels$V1, labels=activity_labels$V2)



### Extracts only the measurements on the mean and standard deviation for each measurement. 
tidydata1 <- data[,c(1,2,grep("std", colnames(data)), grep("mean", colnames(data)))]


# save tidydata1 into results folder
saveResult(tidydata1,"tidydata1")

### Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidydata2 <- ddply(tidydata1, .(id, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })

# Adds "_mean" to colnames
colnames(tidydata2)[-c(1:2)] <- paste(colnames(tidydata2)[-c(1:2)], "_mean", sep="")

# Save tidy tidydata2 into results folder
saveResult(tidydata2,"tidydata2")

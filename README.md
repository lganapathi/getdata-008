getdata-008
===========

getting and cleaning data
=========================
*	The script “run_analysis.R” needs "plyr" package. Make sure it is installed.
*	It needs to  “setInternet2(use=TRUE)” for the download to work properly from https sites
*	Downloads  file  from url:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
*	And saves it as "data.zip" in the working directory.
*	Creates a "results" folder to save the 2 tidy data sets called:
*	“tidydata1” and “tidydata2”
*	Defines a function “getData”  to read a table from the zip file
*	Defines a function “saveResult “ to save the data into the result folder as per specs
*	The script uses these and other functions to:
*	get common data tables
*	uses data from "features.txt"  for col names 
*	Loads the data training and test data sets and merges them using “rbind()” to create one data set “data” and rearranges by id.
*	Uses descriptive activity names from "activity_labels.txt" to name the activities in the data set
*	Extracts only the measurements on the mean and standard deviation for each measurement to a dataset called “tidydata1”
	Creates a second tidy data set, “tidydata2” with the average of each variable for each activity and each subject

Codebook for the 81 columns of tidydata2:
----------------------------------------

1. id
2. activity
3. tBodyAcc.std...X_mean
4. tBodyAcc.std...Y_mean
5. tBodyAcc.std...Z_mean
6. tGravityAcc.std...X_mean
7. tGravityAcc.std...Y_mean
8. tGravityAcc.std...Z_mean
9. tBodyAccJerk.std...X_mean
10. tBodyAccJerk.std...Y_mean
11. tBodyAccJerk.std...Z_mean
12. tBodyGyro.std...X_mean
13. tBodyGyro.std...Y_mean
14. tBodyGyro.std...Z_mean
15. tBodyGyroJerk.std...X_mean
16. tBodyGyroJerk.std...Y_mean
17. tBodyGyroJerk.std...Z_mean
18. tBodyAccMag.std.._mean
19. tGravityAccMag.std.._mean
20. tBodyAccJerkMag.std.._mean
21. tBodyGyroMag.std.._mean
22. tBodyGyroJerkMag.std.._mean
23. fBodyAcc.std...X_mean
24. fBodyAcc.std...Y_mean
25. fBodyAcc.std...Z_mean
26. fBodyAccJerk.std...X_mean
27. fBodyAccJerk.std...Y_mean
28. fBodyAccJerk.std...Z_mean
29. fBodyGyro.std...X_mean
30. fBodyGyro.std...Y_mean
31. fBodyGyro.std...Z_mean
32. fBodyAccMag.std.._mean
33. fBodyBodyAccJerkMag.std.._mean
34. fBodyBodyGyroMag.std.._mean
35. fBodyBodyGyroJerkMag.std.._mean
36. tBodyAcc.mean...X_mean
37. tBodyAcc.mean...Y_mean
38. tBodyAcc.mean...Z_mean
39. tGravityAcc.mean...X_mean
40. tGravityAcc.mean...Y_mean
41. tGravityAcc.mean...Z_mean
42. tBodyAccJerk.mean...X_mean
43. tBodyAccJerk.mean...Y_mean
44. tBodyAccJerk.mean...Z_mean
45. tBodyGyro.mean...X_mean
46. tBodyGyro.mean...Y_mean
47. tBodyGyro.mean...Z_mean
48. tBodyGyroJerk.mean...X_mean
49. tBodyGyroJerk.mean...Y_mean
50. tBodyGyroJerk.mean...Z_mean
51. tBodyAccMag.mean.._mean
52. tGravityAccMag.mean.._mean
53. tBodyAccJerkMag.mean.._mean
54. tBodyGyroMag.mean.._mean
55. tBodyGyroJerkMag.mean.._mean
56. fBodyAcc.mean...X_mean
57. fBodyAcc.mean...Y_mean
58. fBodyAcc.mean...Z_mean
59. fBodyAcc.meanFreq...X_mean
60. fBodyAcc.meanFreq...Y_mean
61. fBodyAcc.meanFreq...Z_mean
62. fBodyAccJerk.mean...X_mean
63. fBodyAccJerk.mean...Y_mean
64. fBodyAccJerk.mean...Z_mean
65. fBodyAccJerk.meanFreq...X_mean
66. fBodyAccJerk.meanFreq...Y_mean
67. fBodyAccJerk.meanFreq...Z_mean
68. fBodyGyro.mean...X_mean
69. fBodyGyro.mean...Y_mean
70. fBodyGyro.mean...Z_mean
71. fBodyGyro.meanFreq...X_mean
72. fBodyGyro.meanFreq...Y_mean
73. fBodyGyro.meanFreq...Z_mean
74. fBodyAccMag.mean.._mean
75. fBodyAccMag.meanFreq.._mean
76. fBodyBodyAccJerkMag.mean.._mean
77. fBodyBodyAccJerkMag.meanFreq.._mean
78. fBodyBodyGyroMag.mean.._mean
79. fBodyBodyGyroMag.meanFreq.._mean
80. fBodyBodyGyroJerkMag.mean.._mean
81. fBodyBodyGyroJerkMag.meanFreq.._mean

Project Goal:
-------------
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

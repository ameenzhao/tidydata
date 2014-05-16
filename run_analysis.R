## Create a data set including train & test data
## Only include mean & standard deviation for each measurement
# Download .zip file and extract it at "WORKING DIRECTORY"
# setwd('WORKING DIRECTORY')
setwd('D:\\E-learning_courses\\Data Science\\Getting and Cleaning Data\\Project\\Assignment')
# Read files
filename <- dir()
ReadFile <- function(file){
  read.table(file)
}
datalist <- lapply(filename, ReadFile)
# Extract 8 data sets
activity.label <- datalist[[1]]
features <- datalist[[2]]
subject.test <- datalist[[3]]
subject.train <- datalist[[4]]
testdata <- datalist[[5]]
traindata <- datalist[[6]]
test.label <- datalist[[7]]
train.label <- datalist[[8]] # test.label & train.label match activity.label
# Merge activity labels
train.label$id <- 1:nrow(train.label)
act <- merge(train.label, activity.label, by = 'V1')
act.train <- act[order(act$id), ][, 3]; length(act.train) # activity labels in train data set
test.label$id <- 1:nrow(test.label)
act <- merge(test.label, activity.label, by = 'V1')
act.test <- act[order(act$id), ][, 3]; length(act.test) # activity labels in test data set
# Add new column variables
traindata <- cbind(subject.train, act.train, traindata)
testdata <- cbind(subject.test, act.test, testdata) # subject & activity
# Add column names 
colnames(traindata) <- c("subject", "activity", as.character(features[, 2]))
colnames(testdata) <- c("subject", "activity", as.character(features[, 2]))
# Select mean & sd columns
id <- c(1:8, 43:48, 83:88, 123:128, 163:168, 203, 204, 216, 217, 229, 230, 242, 243, 255, 256, 268:273, 296:298, 
        347:352, 375:377, 426:431, 454:456, 505, 506, 515, 518, 519, 528, 531, 532, 541, 544, 545, 554)
traindata <- traindata[, id] 
testdata <- testdata[, id] 
# Merge train & test data
all.data <- rbind(traindata, testdata)
# re-name the column variables
colnames(all.data) <- c('subject', 'activity', 'tbodyacc.mean.x', 'tbodyacc.mean.y', 'tbodyacc.mean.z',
                        'tbodyacc.std.x', 'tbodyacc.std.y', 'tbodyacc.std.z', 'tgravityacc.mean.x', 
                        'tgravityacc.mean.y', 'tgravityacc.mean.z', 'tgravityacc.std.x', 'tgravityacc.std.y',
                        'tgravityacc.std.z', 'tbodyaccjerk.mean.X', 'tbodyaccjerk.mean,y', 'tbodyaccjerk.mean,z',
                        'tbodyaccjerk.std.x', 'tbodyaccjerk.std.y', 'tbodyaccjerk.std.z', 'tbodygyro.mean.x',
                        'tbodygyro.mean.y', 'tbodygyro.mean.z', 'tbodygyro.std.x', 'tbodygyro.std.y', 'tbodygyro.std.z',
                        'tbodygyrojerk.mean.x', 'tbodygyrojerk.mean.y', 'tbodygyrojerk.mean.z', 'tbodygyrojerk.std.x',
                        'tbodygyrojerk.std.y', 'tbodygyrojerk.std.z', 'tbodyaccmag.mean', 'tbodyaccmag.std',
                        'tgravityaccmag.mean', 'tgravityaccmag.std', 'tbodyaccjerkmag.mean', 'tbodyaccjerkmag.std',
                        'tbodygyromag.mean', 'tbodygyromag.std', 'tbodygyrojerkmag.mean', 'tbodygyrojerkmag.std', 
                        'fbodyacc.mean.x', 'fbodyacc.mean.y', 'fbodyacc.mean.z','fbodyacc.std.x', 'fbodyacc.std.y', 
                        'fbodyacc.std.z', 'fbodyacc.meanfreq.x', 'fbodyacc.meanfreq.y', 'fbodyacc.meanfreq.z',    
                        'fbodyaccjerk.mean.x', 'fbodyaccjerk.mean.y', 'fbodyaccjerk.mean.z', 'fbodyaccjerk.std.x', 
                        'fbodyaccjerk.std.y', 'fbodyaccjerk.std.z', 'fbodyaccjerk.meanfreq.x', 'fbodyaccjerk.meanfreq.y', 
                        'fbodyaccjerk.meanfreq.z', 'fbodygyro.mean.x', 'fbodygyro.mean.y', 'fbodygyro.mean.z', 
                        'fbodygyro.std.x', 'fbodygyro.std.y', 'fbodygyro.std.z', 'fbodygyro.meanfreq.x', 'fbodygyro.meanfreq.y',
                        'fbodygyro.meanfreq.z', 'fbodyaccmag.mean', 'fbodyaccmag.std', 'fbodyaccmag.meanfreq', 'fbodybodyaccjerkmag.mean',
                        'fbodybodyaccjerkmag.std', 'fbodybodyaccjerkmag.meanfreq', 'fbodybodygyromag.mean', 'fbodybodygyromag.std', 
                        'fbodybodygyromag.meanfreq', 'fbodybodygyrojerkmag.mean', 'fbodybodygyrojerkmag.std', 'fbodybodygyrojerkmag.meanfreq')
all.data[1:3, 1:5] # row 1:3, column 1:5
#   subject activity tbodyacc.mean.x tbodyacc.mean.y tbodyacc.mean.z
# 1       1 STANDING       0.2885845     -0.02029417      -0.1329051
# 2       1 STANDING       0.2784188     -0.01641057      -0.1235202
# 3       1 STANDING       0.2796531     -0.01946716      -0.1134617
## The dimension of 'all.data' is 10299 rows & 81 columns
write.table(all.data, file = 'all.data.txt', quote = F) # save the data 'all.data.txt'


## Create a tidy data set with the average of each variable for each activity & subject
# Re-load activity data sets (train.label & test.label) replacing characters in all.data
train.label <- datalist[[8]]; dim(train.label); test.label <- datalist[[7]]; dim(test.label)
all.data[, 2] <- rbind(train.label, test.label)
data <- id<- data.frame()
for (i in 1:30){
  for (j in 1:6){
    inner.data <- colMeans(all.data[all.data$subject == i & all.data$activity == j, ][, -c(1:2)])
    data <- rbind(data, inner.data)
    id <- rbind(id, c(i, j))
  }
}
outer.data <- cbind(id, data); colnames(outer.data) <- colnames(all.data)
# Replace activity codes to real names 
labels <- rep(activity.label[, 2], 30)
outer.data[, 2] <- labels
outer.data[1:10, 1:5] # row 1:10, column 1:5
#    subject           activity tbodyacc.mean.x tbodyacc.mean.y tbodyacc.mean.z
# 1        1            WALKING       0.2773308    -0.017383819      -0.1111481
# 2        1   WALKING_UPSTAIRS       0.2554617    -0.023953149      -0.0973020
# 3        1 WALKING_DOWNSTAIRS       0.2891883    -0.009918505      -0.1075662
# 4        1            SITTING       0.2612376    -0.001308288      -0.1045442
# 5        1           STANDING       0.2789176    -0.016137590      -0.1106018
# 6        1             LAYING       0.2215982    -0.040513953      -0.1132036
# 7        2            WALKING       0.2764266    -0.018594920      -0.1055004
# 8        2   WALKING_UPSTAIRS       0.2471648    -0.021412113      -0.1525139
# 9        2 WALKING_DOWNSTAIRS       0.2776153    -0.022661416      -0.1168129
# 10       2            SITTING       0.2770874    -0.015687994      -0.1092183
write.table(outer.data, file = 'tidy.data.txt', quote = F) # save the data 'tidy.data.txt'
## End
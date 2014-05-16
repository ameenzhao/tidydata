## DATA DICTIONARY (tidy.data.txt) 



The original data sets include 561 variables. The purpose of this R script is to clean it and produce a tidy data set 'tidy.data.txt'.  


- 'tidy.data.txt' includes 180 rows and 81 columns totally. Each entry indicates the average of each variable for each 'subject' and each 'activity'.


- 'subject': An identifier of the subject who carried out the experiment, range is 1, 2, 3, ..., 30.

- 'activity': Identify the activities performed by each person, six factors totally: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.


Other variables are numeric variables:

- prefix 't' and 'f' refer to time domain signals and frequency domain signals, respectively;

- 'acc' and 'gyro' refer to accelerometer and gyroscope, respectively;

- '.x', '.y', and '.z' refer to 3-axial signals respectively;

- '.mean', '.std', and '.meanfreq' refer to mean value, standard deviation, and mean frequency, respectively.


The list of the numeric variables (79 totally):

'tbodyacc.mean.x'

'tbodyacc.mean.y'

'tbodyacc.mean.z'

'tbodyacc.std.x'

'tbodyacc.std.y'

'tbodyacc.std.z' 

'tgravityacc.mean.x'

'tgravityacc.mean.y'

'tgravityacc.mean.z'

'tgravityacc.std.x'

'tgravityacc.std.y' 

'tgravityacc.std.z'

'tbodyaccjerk.mean.X'

'tbodyaccjerk.mean,y'

'tbodyaccjerk.mean,z'

'tbodyaccjerk.std.x' 

'tbodyaccjerk.std.y'

'tbodyaccjerk.std.z' 

'tbodygyro.mean.x'

'tbodygyro.mean.y' 

'tbodygyro.mean.z'

'tbodygyro.std.x'

'tbodygyro.std.y' 

'tbodygyro.std.z'

'tbodygyrojerk.mean.x' 

'tbodygyrojerk.mean.y'

'tbodygyrojerk.mean.z'

'tbodygyrojerk.std.x'

'tbodygyrojerk.std.y'

'tbodygyrojerk.std.z'

'tbodyaccmag.mean'

'tbodyaccmag.std'

'tgravityaccmag.mean'

'tgravityaccmag.std'

'tbodyaccjerkmag.mean'

'tbodyaccjerkmag.std'

'tbodygyromag.mean'

'tbodygyromag.std'

'tbodygyrojerkmag.mean'

'tbodygyrojerkmag.std' 

'fbodyacc.mean.x'

'fbodyacc.mean.y'

'fbodyacc.mean.z'

'fbodyacc.std.x'

'fbodyacc.std.y' 

'fbodyacc.std.z'

'fbodyacc.meanfreq.x'

'fbodyacc.meanfreq.y'

'fbodyacc.meanfreq.z'  

'fbodyaccjerk.mean.x'

'fbodyaccjerk.mean.y'

'fbodyaccjerk.mean.z'

'fbodyaccjerk.std.x' 

'fbodyaccjerk.std.y' 

'fbodyaccjerk.std.z'

'fbodyaccjerk.meanfreq.x'

'fbodyaccjerk.meanfreq.y' 

'fbodyaccjerk.meanfreq.z' 

'fbodygyro.mean.x'

'fbodygyro.mean.y'

'fbodygyro.mean.z' 

'fbodygyro.std.x' 

'fbodygyro.std.y'

'fbodygyro.std.z'

'fbodygyro.meanfreq.x'

'fbodygyro.meanfreq.y'

'fbodygyro.meanfreq.z' 

'fbodyaccmag.mean'

'fbodyaccmag.std'

'fbodyaccmag.meanfreq'

'fbodybodyaccjerkmag.mean'

'fbodybodyaccjerkmag.std' 

'fbodybodyaccjerkmag.meanfreq'

'fbodybodygyromag.mean'

'fbodybodygyromag.std' 

'fbodybodygyromag.meanfreq'

'fbodybodygyrojerkmag.mean'

'fbodybodygyrojerkmag.std'

'fbodybodygyrojerkmag.meanfreq'





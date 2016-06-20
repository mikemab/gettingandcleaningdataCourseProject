# Codebook




Summary of data in the tidy.txt, that was created using the r_analysis.R script. This codebook is generated with R Markdown, to be easily modifiable

### Subject Identifier
This variable takes the value 1-30 representing the subject number in the experiment. 

```
## [1] "subject_id"
```

###Activity Identifier
This variable represents the activity of the subjects, when the measurements are taken [6 Activities]. Change from the original dataset by representing the numbers by the corresponding activity name

```
## [1] "act_id"
```
These represent the activity labels, that will appear in the Activity Identifier

```
## [1] "walking"            "walking_upstairs"   "walking_downstairs"
## [4] "sitting"            "standing"           "laying"
```

Each person is notes to have performed six activities which include Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and Laying these are represented as in the tidy data set, and in the full data set as {1-6} respectively

###Measurements

Finally each of the measurements in the tidy datasets represents an aggregation by mean for each activity and subject accordingly. Measurements representing Subjects 1 Walking activity are the average of all the measurements identified as subject_id = 1 and Activity: Walking


```
##  [1] "tbodyaccmeanx"                "tbodyaccmeany"               
##  [3] "tbodyaccmeanz"                "tbodyaccstdx"                
##  [5] "tbodyaccstdy"                 "tbodyaccstdz"                
##  [7] "tgravityaccmeanx"             "tgravityaccmeany"            
##  [9] "tgravityaccmeanz"             "tgravityaccstdx"             
## [11] "tgravityaccstdy"              "tgravityaccstdz"             
## [13] "tbodyaccjerkmeanx"            "tbodyaccjerkmeany"           
## [15] "tbodyaccjerkmeanz"            "tbodyaccjerkstdx"            
## [17] "tbodyaccjerkstdy"             "tbodyaccjerkstdz"            
## [19] "tbodygyromeanx"               "tbodygyromeany"              
## [21] "tbodygyromeanz"               "tbodygyrostdx"               
## [23] "tbodygyrostdy"                "tbodygyrostdz"               
## [25] "tbodygyrojerkmeanx"           "tbodygyrojerkmeany"          
## [27] "tbodygyrojerkmeanz"           "tbodygyrojerkstdx"           
## [29] "tbodygyrojerkstdy"            "tbodygyrojerkstdz"           
## [31] "tbodyaccmagmean"              "tbodyaccmagstd"              
## [33] "tgravityaccmagmean"           "tgravityaccmagstd"           
## [35] "tbodyaccjerkmagmean"          "tbodyaccjerkmagstd"          
## [37] "tbodygyromagmean"             "tbodygyromagstd"             
## [39] "tbodygyrojerkmagmean"         "tbodygyrojerkmagstd"         
## [41] "fbodyaccmeanx"                "fbodyaccmeany"               
## [43] "fbodyaccmeanz"                "fbodyaccstdx"                
## [45] "fbodyaccstdy"                 "fbodyaccstdz"                
## [47] "fbodyaccmeanfreqx"            "fbodyaccmeanfreqy"           
## [49] "fbodyaccmeanfreqz"            "fbodyaccjerkmeanx"           
## [51] "fbodyaccjerkmeany"            "fbodyaccjerkmeanz"           
## [53] "fbodyaccjerkstdx"             "fbodyaccjerkstdy"            
## [55] "fbodyaccjerkstdz"             "fbodyaccjerkmeanfreqx"       
## [57] "fbodyaccjerkmeanfreqy"        "fbodyaccjerkmeanfreqz"       
## [59] "fbodygyromeanx"               "fbodygyromeany"              
## [61] "fbodygyromeanz"               "fbodygyrostdx"               
## [63] "fbodygyrostdy"                "fbodygyrostdz"               
## [65] "fbodygyromeanfreqx"           "fbodygyromeanfreqy"          
## [67] "fbodygyromeanfreqz"           "fbodyaccmagmean"             
## [69] "fbodyaccmagstd"               "fbodyaccmagmeanfreq"         
## [71] "fbodybodyaccjerkmagmean"      "fbodybodyaccjerkmagstd"      
## [73] "fbodybodyaccjerkmagmeanfreq"  "fbodybodygyromagmean"        
## [75] "fbodybodygyromagstd"          "fbodybodygyromagmeanfreq"    
## [77] "fbodybodygyrojerkmagmean"     "fbodybodygyrojerkmagstd"     
## [79] "fbodybodygyrojerkmagmeanfreq"
```


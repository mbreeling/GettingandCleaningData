==================================================================
Human Activity Recognition Using Smartphones Dataset
Script to produce tidy version by Michael Breeling
==================================================================
Original data from:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The submission includes the following files:
=========================================

- 'README.md'
- 'CodeBook.md
- 'run_analysis.R'

The script 'run_analysis.R' assumes that you have the folder 'getdata-projectfiles-UCI HAR Dataset' in your working directory. Given this, it outputs a file called 'Tidy_UCI_HAR.txt' containing a tidy version of the data. If you don't have the package 'dplyr' installed, it will be necessary to install it using 'install.packages('dplyr')'. 

The script itself works in several steps:

1.) Read in the test data set from 'X_test.txt'. Label with the descriptive variable names from 'features.txt'. Add 'activity' and 'subject' columns from 'y_test.txt' and 'subject_test.txt' respectively.

2.) Do the same thing for the 'train' data set, then combine the 'test' and 'train' frames.

3.) Subset the data to just give columns with variable names containing either 'mean()' or 'std()'. The 'activity' and 'subject' columns are also retained.

4.) Rename the 'activity' factors with descriptive names from 'activity_labels.txt' and clean up descriptive variable names.

5.) Create and output the second data set 'Tidy_UCI_HAR.txt' by taking means of each measurement variable grouped by the 'activity' and 'subject' factors.




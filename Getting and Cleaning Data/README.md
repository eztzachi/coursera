**Getting and Cleaning Data Project**
============================
This is the final project of the course. The goal is to create a tidy data, that can be used for later analysis, from a human activity raw data that was collected by UCI students during [this](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) experiment.

----------

Installation
------------
 1. This project uses the [dplyr](http://cran.r-project.org/web/packages/dplyr/index.html) package. To make sure it is installed  and up to date please run in the R console:
`install.packages("dplyr")`
 2. Download the [raw data](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip), extract it and make sure to copy the following files to your working directory:
  * subject_train.txt
  * X_train.txt
  * y_train.txt
  * subject_test.txt
  * X_test.txt
  * y_test.txt
  * features.txt
  * activity_labels.txt
 3. Make sure the run_analysis.R script from this repository exist in your working directory as well

Usage
-------------

 1. Make sure the active directory in your R console points to the right path where all the files mentioned above are stored: `setwd("/path/to/working/directory/")`
 2. Run the following command, which will run the script: `source("run_analysis.R")`
 3. The tidy data will we written to to a file named tidy_data.txt under the same working directory.
 4. Also, a tidy_data variable which contains the tidy_data set will be added to the R environment in case farther usage is required.


> **Note:**
> During the running of the script you might see a notification about masked objects. This is normal and part of the loading of the dplyr libarary.

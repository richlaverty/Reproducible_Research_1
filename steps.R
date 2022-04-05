# LOADING AND PREPROCESSING THE DATA
# Show any code that is needed to:
# 1. Load the data (i.e. read.csv())
# 2. Process/transform the data (if necessary) into a format suitable for your analysis

# clean up the workspace

rm(list = ls())

# set the working directory and download the data, if necessary

setwd("/home/rich/Documents/programs/data_science/05_Reproducible_Research/Reproducible_Research_1")

# import the data

if(file.exists("./data/repdata_data_activity/activity.csv"))
{
  activity <- read.csv("./data/repdata_data_activity/activity.csv")
}

# there are 3 columns to the data
# 1. steps  - an integer count of the steps taken
# 2. date - a "NULL" class giving the date of the data in YYYY-MM-DD format
# 3. interval - an integer giving the minutes since midnight

# make entries in the date column members of the "Date" class
# activity$date <- as.Date(as.character(activity$date))

# WHAT IS THE MEAN TOTAL NUMBER OF STEPS TAKEN PER DAY?
#
# For this part of the assignment, ignore the missing values in the dataset.
# 1. Calculate the total number of steps taken per day
# 2. Make a histogram of the total number of steps taken each day
# 3. Calculate and report the mean and median of the total number of steps taken per day

library(dplyr)

byday <- group_by(activity, date)
totalSteps <- summarize(byday, total = sum(steps))
hist(totalSteps$total)
stepsMean = mean(totalSteps$total, na.rm = TRUE)
stepsMedian = median(totalSteps$total, na.rm = TRUE)

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

# get the sum of steps taken each day:
library(dplyr)
byday <- group_by(activity, date)
totalSteps <- summarize(byday, total = sum(steps))
hist(totalSteps$total)

# clean up the workspace

rm(list = ls())

# set the working directory and download the data, if necessary

setwd("/home/rich/Documents/programs/data_science/05_Reproducible_Research/Reproducible_Research_1")

# import the data

if(file.exists("./data/repdata_data_activity/activity.csv"))
{
  activity <- read.csv("./data/repdata_data_activity/activity.csv")
}

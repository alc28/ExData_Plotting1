# Project 1, Exploring Data Analysis
# plot1.R
# by Adam Chandler
# 2014-12-07

# Preparing Dataset
# This script processes this dataset: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip, Electric power consumption [20Mb]
# Download the data and unzip it in the same working directory as this script.

# Clear Global Environment Variables
rm(list = ls())

# load data
if (exists("household_power_consumption")) {
  print("household_power_consumption exists as data.frame")
} else {
  print("loading household_power_consumption data ...")
  household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, nrows=2880, skip=66636,na.strings = c("?",""))
  names(household_power_consumption) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
}

# Create plot1
png(file="plot1.png",width=480,height=480,res=70)
hist(household_power_consumption$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

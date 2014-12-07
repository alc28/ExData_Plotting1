# Project 1, Exploring Data Analysis
# plot4.R
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
  household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, nrows=2880, skip=66636, na.strings = c("?",""))
  names(household_power_consumption) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
}

# Create plot4
Date_time <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S")
df <- cbind(Date_time,household_power_consumption)
png(file="plot4.png",width=480,height=480,res=70)
# frame
par(mfrow = c(2,2))

# topleft
plot(df$Date_time, df$Global_active_power, xlab="", ylab="Global Active Power", type="l")

#2 topright
plot(df$Date_time, df$Voltage, xlab="datetime", ylab="Voltage", type="l")

#3 botleft
plot(df$Date_time, df$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", col="black")
lines(df$Date_time, df$Sub_metering_2, xlab="", ylab="Energy sub metering", type="l", col="red")
lines(df$Date_time, df$Sub_metering_3, xlab="", ylab="Energy sub metering", type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=c(1,1,1), lty=1, cex=0.7, bty = "n")

#4 botright
plot(df$Date_time, df$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()

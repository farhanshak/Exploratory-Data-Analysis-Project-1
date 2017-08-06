# Coursera Data Science: Exploratory Data Analysis #

# WD i.e. file location

setwd("C:/Users/Farhan/Documents/R/Data science/Course 4")

## Load the relevant data from the table

rm(list = ls())
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

# Convert the date variable to a Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Create a Subset of the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert the dates and times to proper format
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Create and Save Plot 3
data$datetime <- as.POSIXct(data$datetime)

attach(data)
plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(data)
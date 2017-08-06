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

# Create and Save Plot 2
data$datetime <- as.POSIXct(data$datetime)
attach(data)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)
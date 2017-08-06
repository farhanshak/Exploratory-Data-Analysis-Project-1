# Coursera Data Science: Exploratory Data Analysis #

# WD i.e. file location

setwd("C:/Users/Farhan/Documents/R/Data science/Course 4")


# Load the relevant data from table

rm(list = ls())
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

# Convert the date variable to a Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Create Subset of the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert of dates and times to a proper format
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Create and save Plot 1
attach(data)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# Save file to working directory
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(data)
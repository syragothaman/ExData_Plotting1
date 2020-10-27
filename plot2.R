# Exploratory Data Analysis: Course Project 1
# By: Sowmya Ragothaman

# Plot 2

#Import and clean up data
library(data.table)
data <- fread('Coursera/household_power_consumption.txt')                 #Read the file into R from Coursera folder
feb <- data[Date == "1/2/2007" | Date == "2/2/2007"]                      #Selecting the desired dates
feb$Date <- as.Date(feb[, Date], "%d/%m/%Y")                              #Converting dates into date class
feb$Datetime <- as.POSIXct(paste(feb$Date, feb$Time, seperator = " "))    #Combined time and date columns into new column

# Create the plot 
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(feb$Datetime,feb$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

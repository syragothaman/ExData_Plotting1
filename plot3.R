# Exploratory Data Analysis: Course Project 1
# By: Sowmya Ragothaman

# Plot 3

#Import and clean up data
library(data.table)
data <- fread('Coursera/household_power_consumption.txt')                 #Read the file into R from Coursera folder
feb <- data[Date == "1/2/2007" | Date == "2/2/2007"]                      #Selecting the desired dates
feb$Date <- as.Date(feb[, Date], "%d/%m/%Y")                              #Converting dates into date class
feb$Datetime <- as.POSIXct(paste(feb$Date, feb$Time, seperator = " "))    #Combined time and date columns into new column

# Create the plot: first a blank plot is made, then 3 sets of data points are added
png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(feb$Datetime, feb$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(feb$Datetime, feb$Sub_metering_1, type = "l", col = "black" )
points(feb$Datetime, feb$Sub_metering_2, type = "l", col = "red" )
points(feb$Datetime, feb$Sub_metering_3, type = "l", col = "blue" )
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)
dev.off()
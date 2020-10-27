# Exploratory Data Analysis: Course Project 1
# By: Sowmya Ragothaman

# Plot 4

#Import and clean up data
library(data.table)
data <- fread('Coursera/household_power_consumption.txt')                 #Read the file into R from Coursera folder
feb <- data[Date == "1/2/2007" | Date == "2/2/2007"]                      #Selecting the desired dates
feb$Date <- as.Date(feb[, Date], "%d/%m/%Y")                              #Converting dates into date class
feb$Datetime <- as.POSIXct(paste(feb$Date, feb$Time, seperator = " "))    #Combined time and date columns into new column

# Create the plots- 4 plots in 2 rows and 2 columns
png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

#plot 1
plot(feb$Datetime,feb$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#plot 2: note the change in the x axis label
plot(feb$Datetime,feb$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#plot 3: requires adding 3 sets of data
plot(feb$Datetime, feb$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(feb$Datetime, feb$Sub_metering_1, type = "l", col = "black" )
points(feb$Datetime, feb$Sub_metering_2, type = "l", col = "red" )
points(feb$Datetime, feb$Sub_metering_3, type = "l", col = "blue" )
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)

#plot 4: note the change in the x axis label and y variable
plot(feb$Datetime,feb$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
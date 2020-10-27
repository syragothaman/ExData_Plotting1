# Exploratory Data Analysis: Course Project 1
# By: Sowmya Ragothaman

# Plot 1

#Import and clean up data
library(data.table)
data <- fread('Coursera/household_power_consumption.txt')       #Read the file into R from Coursera folder
feb <- data[Date == "1/2/2007" | Date == "2/2/2007"]            #Selecting the desired dates
feb$Date <- as.Date(feb[, Date], "%d/%m/%Y")                    #Converting dates into date class
feb$Global_active_power <- as.numeric(feb$Global_active_power)  #Converting a column into numeric class  

# Create the histogram 
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(feb$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     col = "red",
     )
dev.off()

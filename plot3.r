## Coursera - Exploratory Data Analysis - Plotting Assignment 1
## plot3.R - generates plot3.png

##Put the file in the working directory
filename <- "exdata-data-household_power_consumption.zip"
initial <- read.table(unz(filename, "household_power_consumption.txt"), header=T, sep=";", stringsAsFactors=F, na.strings="?", nrows = 100)
classes <- sapply(initial, class)

##Read the data from the zipped file and apply classes of the dataset
hpowconsn3 <- read.table(unz(filename, "household_power_consumption.txt"), header=T, sep=";", stringsAsFactors=F, na.strings="?",colClasses = classes)

## Format date and time and subset data only between 2007-02-01 and 2007-02-02
hpowconsn3$timestamp = strptime(paste(hpowconsn3$Date, hpowconsn3$Time), format="%d/%m/%Y %H:%M:%S", tz="UTC") 
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC") 
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC") 
hpowconsn3 = hpowconsn3[hpowconsn3$timestamp >= startDate & hpowconsn3$timestamp <= endDate, ] 

##Plot the desired chart
png(filename="plot3.png", width=480, height=480) 
plot(hpowconsn3$timestamp, hpowconsn3$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering") 
lines(hpowconsn3$timestamp, hpowconsn3$Sub_metering_2, col="red") 
lines(hpowconsn3$timestamp, hpowconsn3$Sub_metering_3, col="blue") 
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
col=c("black", "red", "blue"), lwd=par("lwd")) 

##Close the device
dev.off()

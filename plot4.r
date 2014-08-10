## Coursera - Exploratory Data Analysis - Plotting Assignment 1
## plot4.R - generates plot4.png

##Put the file in the working directory
filename <- "exdata-data-household_power_consumption.zip"
initial <- read.table(unz(filename, "household_power_consumption.txt"), header=T, sep=";", stringsAsFactors=F, na.strings="?", nrows = 100)
classes <- sapply(initial, class)

##Read the data from the zipped file and apply classes of the dataset
hpowconsn4 <- read.table(unz(filename, "household_power_consumption.txt"), header=T, sep=";", stringsAsFactors=F, na.strings="?",colClasses = classes)

## Format date and time and subset data only between 2007-02-01 and 2007-02-02
hpowconsn4$timestamp = strptime(paste(hpowconsn4$Date, hpowconsn4$Time), format="%d/%m/%Y %H:%M:%S", tz="UTC") 
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC") 
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC") 
hpowconsn4 = hpowconsn4[hpowconsn4$timestamp >= startDate & hpowconsn4$timestamp <= endDate, ] 

png(filename="plot4.png", width=480, height=480) 

##Set teh layout of the charts
par(mfcol=c(2,2)) 

##Plot 1st chart
plot(hpowconsn4$timestamp, hpowconsn4$Global_active_power, type="l", xlab="", ylab="Global Active Power") 

##Plot 2nd chart
plot(hpowconsn4$timestamp, hpowconsn4$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering") 
lines(hpowconsn4$timestamp, hpowconsn4$Sub_metering_2, col="red") 
lines(hpowconsn4$timestamp, hpowconsn4$Sub_metering_3, col="blue") 
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lwd=par("lwd"), bty="n") 

##Plot 3rd chart
plot(hpowconsn4$timestamp, hpowconsn4$Voltage, type="l",xlab="datetime", ylab="Voltage") 

##Plot 4th chart
plot(hpowconsn4$timestamp, hpowconsn4$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power") 

##Close device
dev.off()

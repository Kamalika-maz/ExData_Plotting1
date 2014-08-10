## Coursera - Exploratory Data Analysis - Plotting Assignment 1
## plot2.R - generates plot2.png

##Put the file in the working directory
filename <- "exdata-data-household_power_consumption.zip"
initial <- read.table(unz(filename, "household_power_consumption.txt"), header=T, sep=";", stringsAsFactors=F, na.strings="?", nrows = 100)
classes <- sapply(initial, class)

##Read the data from the zipped file and apply classes of the dataset
hpowconsn2 <- read.table(unz(filename, "household_power_consumption.txt"), header=T, sep=";", stringsAsFactors=F, na.strings="?",colClasses = classes)

## Format date and time and subset data only between 2007-02-01 and 2007-02-02
hpowconsn2$timestamp = strptime(paste(hpowconsn2$Date, hpowconsn2$Time), format="%d/%m/%Y %H:%M:%S", tz="UTC") 
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC") 
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC") 
hpowconsn2 = hpowconsn2[hpowconsn2$timestamp >= startDate & hpowconsn2$timestamp <= endDate, ] 

##Plot the desired chart
png(filename="plot2.png", width=480, height=480) 
plot(hpowconsn2$timestamp, hpowconsn2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

##Close the device
dev.off()

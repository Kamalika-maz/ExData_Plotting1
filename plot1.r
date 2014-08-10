## Coursera - Exploratory Data Analysis - Plotting Assignment 1
## plot1.R - generates plot1.png

##Put the file in the working directory
filename <- "exdata-data-household_power_consumption.zip"

initial <- read.table(unz(filename, "household_power_consumption.txt"), header=T, sep=";", stringsAsFactors=F, na.strings="?", nrows = 100)
classes <- sapply(initial, class)

##Read the data from the zipped file and apply classes of the dataset
hpowconsn <- read.table(unz(filename, "household_power_consumption.txt"), header=T, sep=";", stringsAsFactors=F, na.strings="?",colClasses = classes)

## Format date and subset data only between 2007-02-01 and 2007-02-02
hpowconsn$Date = as.Date(hpowconsn$Date, format="%d/%m/%Y") 
startDate = as.Date("01/02/2007", format="%d/%m/%Y") 
endDate = as.Date("02/02/2007", format="%d/%m/%Y") 
hpowconsn = hpowconsn[hpowconsn$Date >= startDate & hpowconsn$Date <= endDate, ] 

##Plot the desired chart
png(filename="plot1.png", width=480, height=480) 
hist(hpowconsn$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red") 
dev.copy(png, file = "plot1.png") 

##Close the device
dev.off() 

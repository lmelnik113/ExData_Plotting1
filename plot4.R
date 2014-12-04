#Plot 2

#Read in the file & subset it
file <- "/Users/lmelnik/Dropbox/Cousera/Exploratory_Data_Analysis/household_power_consumption.txt"
all_household_data <- read.csv(file,sep=";", stringsAsFactors=F , na.strings="?", header=T)
all_household_data$Date <- as.Date(all_household_data$Date, format="%d/%m/%Y")
household_data <- subset(all_household_data, Date >= "2007/02/01" & Date <= "2007/02/02")
datetime <- as.POSIXct(paste(household_data$Date, household_data$Time, sep=" "))

#Create the plot

png(filename = "plot4.png",
   width = 480, height = 480)
par(mfcol=(c(2,2)))
#First plot
plot(datetime,household_data$Global_active_power, 
     type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")
#Second plot
plot(datetime,household_data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(datetime, household_data$Sub_metering_2,col="red")
lines(datetime, household_data$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"))
plot(datetime, household_data$Voltage, type="l", ylab="Voltage")
plot(datetime, household_data$Global_reactive_power, type="l", ylab="Global_reactive_power")
dev.off()
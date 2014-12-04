#Plot 1

#Read in the file & subset it
file <- "/Users/lmelnik/Dropbox/Cousera/Exploratory_Data_Analysis/household_power_consumption.txt"
all_household_data <- read.csv(file,sep=";", stringsAsFactors=F , na.strings="?", header=T)
all_household_data$Date <- as.Date(all_household_data$Date, format="%d/%m/%Y")
household_data <- subset(all_household_data, Date >= "2007/02/01" & Date <= "2007/02/02")


#Create the plot
png(filename = "plot1.png",
    width = 480, height = 480)
hist(household_data$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

dev.off()


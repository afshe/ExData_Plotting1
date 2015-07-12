file <- "C:/Users/206421682/DataScienceSpecialization/Exploratory Data Analysis/Project1/exdata-data-household_power_consumption/household_power_consumption.txt"
#Read file
hh_power_data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset of data from 1/2/2007 to 2/2/2007
subset_data <- hh_power_data[hh_power_data$Date %in% c("1/2/2007","2/2/2007") ,]

global_active_power <- as.numeric(subset_data$Global_active_power)
global_reactive_power <- as.numeric(subset_data$Global_reactive_power)
voltage <- as.numeric(subset_data$Voltage)
datetimedata <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

sub_metering1 <- as.numeric(subset_data$Sub_metering_1)
sub_metering2 <- as.numeric(subset_data$Sub_metering_2)
sub_metering3 <- as.numeric(subset_data$Sub_metering_3)

#png device with 2 rows and 2 columns
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 


#plotting data
plot(datetimedata, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetimedata, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetimedata, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetimedata, sub_metering2, type="l", col="red")
lines(datetimedata, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetimedata, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
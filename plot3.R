file <- "C:/Users/206421682/DataScienceSpecialization/Exploratory Data Analysis/Project1/exdata-data-household_power_consumption/household_power_consumption.txt"
#Read file
hh_power_data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset of data from 1/2/2007 to 2/2/2007
subset_data <- hh_power_data[hh_power_data$Date %in% c("1/2/2007","2/2/2007") ,]

global_active_power <- as.numeric(subset_data$Global_active_power)
datetimedata <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

sub_metering1 <- as.numeric(subset_data$Sub_metering_1)
sub_metering2 <- as.numeric(subset_data$Sub_metering_2)
sub_metering3 <- as.numeric(subset_data$Sub_metering_3)

#png device
png("plot3.png", width=480, height=480)

#plot data
plot(datetimedata, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetimedata, sub_metering2, type="l", col="red")
lines(datetimedata, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
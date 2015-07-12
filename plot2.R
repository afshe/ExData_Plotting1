file <- "C:/Users/206421682/DataScienceSpecialization/Exploratory Data Analysis/Project1/exdata-data-household_power_consumption/household_power_consumption.txt"
hh_power_data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE,dec=".")
subset_data <- hh_power_data[hh_power_data$Date %in% c("1/2/2007","2/2/2007") ,]


global_active_power <- as.numeric(subset_data$Global_active_power)
datetimedata <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetimedata, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
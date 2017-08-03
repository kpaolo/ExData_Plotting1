fileUrl <- "household_power_consumption.txt"

HPC <- read.table(fileUrl, header = T, sep = ";", na.strings = "?")

#Subseting HPC where dates 2007-02-01 and 2007-02-2
HPC <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007"),]

#combining and converting Date and Time column to POSIXlt format
datetime <- strptime(paste(HPC$Date, HPC$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

Sub_metering_1 <- HPC$Sub_metering_1
Sub_metering_2 <- HPC$Sub_metering_2
Sub_metering_3 <- HPC$Sub_metering_3

#Making the four plot
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(datetime, HPC$Global_active_power, xlab = "", ylab = "Global Active Power(kilowatts)", type = "l")

plot(datetime, HPC$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, Sub_metering_1, xlab ="", ylab = "Energy sub metering", type = "l")
lines(datetime, Sub_metering_2, type = "l", col = "red")
lines(datetime, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

plot(datetime, HPC$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()
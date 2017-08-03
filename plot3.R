fileUrl <- "household_power_consumption.txt"

HPC <- read.table(fileUrl, header = T, sep = ";", na.strings = "?")

#Subseting HPC where dates 2007-02-01 and 2007-02-2
HPC <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007"),]

#combining and converting Date and Time column to POSIXlt format
datetime <- strptime(paste(HPC$Date, HPC$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

Sub_metering_1 <- HPC$Sub_metering_1
Sub_metering_2 <- HPC$Sub_metering_2
Sub_metering_3 <- HPC$Sub_metering_3


png("plot3.png", width = 480, height = 480)

plot(datetime, Sub_metering_1, xlab ="", ylab = "Energy sub metering", type = "l")
lines(datetime, Sub_metering_2, type = "l", col = "red")
lines(datetime, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("sub_metering_1", "sub_meteringi_2", "sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()
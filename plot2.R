fileUrl <- "household_power_consumption.txt"

HPC <- read.table(fileUrl, header = T, sep = ";", na.strings = "?")

#Subseting HPC where dates 2007-02-01 and 2007-02-2
HPC <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007"),]

#combining and converting Date and Time column to POSIXlt format
datetime <- strptime(paste(HPC$Date, HPC$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Making a hist plot of Global Active power and saving in png file
png("plot2.png", width = 480, height = 480)
plot(datetime, hpc$Global_active_power, xlab = "", ylab = "Global Active Power(kilowatts)", type = "l")
dev.off()
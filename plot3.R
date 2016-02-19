library(data.table)

# Load the data.
alldata <- fread("household_power_consumption.txt", na.strings=c("?"))
hpc <- alldata[which(alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007"),]

# Fix the date format, and make a DateAndTime column.
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc$DateTime <- hpc[, as.POSIXct(paste(Date, Time), format='%Y-%m-%d %H:%M:%S', tz='GMT')]

# Plot into a png
png("plot3.png", width=480, height=480)
plot(hpc$DateTime, hpc$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="n")
lines(hpc$DateTime, hpc$Sub_metering_1, type = "S")
lines(hpc$DateTime, hpc$Sub_metering_2, col = "red", type = "S")
lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue", type = "S")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

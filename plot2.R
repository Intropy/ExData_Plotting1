library(data.table)

# Load the data.
alldata <- fread("household_power_consumption.txt", na.strings=c("?"))
hpc <- alldata[which(alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007"),]

# Fix the date format, and make a DateAndTime column.
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
hpc$DateTime <- hpc[, as.POSIXct(paste(Date, Time), format='%Y-%m-%d %H:%M:%S', tz='GMT')]

# Plot into a png
png("plot2.png", width=480, height=480)
plot(hpc$DateTime, hpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()

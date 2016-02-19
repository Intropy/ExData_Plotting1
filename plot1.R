library(data.table)

# Load the data.
alldata <- fread("household_power_consumption.txt", na.strings=c("?"))
hpc <- alldata[which(alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007"),]

# Plot into a png
png("plot1.png", width=480, height=480)
hist(hpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

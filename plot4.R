# Read Data
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=';',stringsAsFactors=FALSE)

# Subsetting data
x <- subset(mydata, Date == '1/2/2007' | Date == '2/2/2007')

# preparing Data
y<-cbind(DateTime=paste(x$Date, x$Time),x)
y$DateTime<-strptime(y$DateTime, "%d/%m/%Y %H:%M:%S")
y$Global_active_power <- as.numeric(x$Global_active_power)

# Plot the graph
par(mfcol=c(2,2))

plot(y$DateTime, y$Global_active_power, type='n', ylab='Global Active Power (Kilowatts)', xlab='')
lines(y$DateTime, y$Global_active_power)

plot(y$DateTime, y$Sub_metering_1, type='n', ylab='Energy sub metering', xlab='')
legend("topright", xjust=0.5, lty=1, col=c('black','red','blue'), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
lines(y$DateTime, y$Sub_metering_1, col='black')
lines(y$DateTime, y$Sub_metering_2, col='red')
lines(y$DateTime, y$Sub_metering_3, col='blue')

plot(y$DateTime, y$Voltage, type='n',ylab='Voltage', xlab='datetime')
lines(y$DateTime, y$Voltage)

plot(y$DateTime, y$Global_reactive_power, type='n',ylab='Global_reactive_power', xlab='datetime')
lines(y$DateTime, y$Global_reactive_power)

# save plot to PNG
dev.copy(png,'plot4.png')
dev.off()
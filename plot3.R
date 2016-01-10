# Read Data
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=';',stringsAsFactors=FALSE)

# Subsetting data
x <- subset(mydata, Date == '1/2/2007' | Date == '2/2/2007')

# preparing Data
y<-cbind(DateTime=paste(x$Date, x$Time),x)
y$DateTime<-strptime(y$DateTime, "%d/%m/%Y %H:%M:%S")
y$Global_active_power <- as.numeric(x$Global_active_power)

# Plot the graph
plot(y$DateTime, y$Sub_metering_1, type='n', ylab='Energy sub metering', xlab='')
legend("topright", xjust=0.5, lty=1, col=c('black','red','blue'), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
lines(y$DateTime, y$Sub_metering_1, col='black')
lines(y$DateTime, y$Sub_metering_2, col='red')
lines(y$DateTime, y$Sub_metering_3, col='blue')

# save plot to PNG
dev.copy(png,'plot3.png')
dev.off()
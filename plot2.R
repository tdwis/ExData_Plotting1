# Read Data
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=';',stringsAsFactors=FALSE)

# Subsetting data
x <- subset(mydata, Date == '1/2/2007' | Date == '2/2/2007')

# preparing Data
y<-cbind(DateTime=paste(x$Date, x$Time),x)
y$DateTime<-strptime(y$DateTime, "%d/%m/%Y %H:%M:%S")
y$Global_active_power <- as.numeric(x$Global_active_power)

# Plot the graph
plot(y$DateTime, y$Global_active_power, type='n', ylab='Global Active Power (Kilowatts)', xlab='')
lines(y$DateTime, y$Global_active_power)

# save plot to PNG
dev.copy(png,'plot2.png')
dev.off()
# Read Data
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=';',stringsAsFactors=FALSE)

# Subsetting data
x <- subset(mydata, Date == '1/2/2007' | Date == '2/2/2007')

# preparing Data
y<-cbind(DateTime=paste(x$Date, x$Time),x)
y$DateTime<-strptime(y$DateTime, "%d/%m/%Y %H:%M:%S")
y$Global_active_power <- as.numeric(x$Global_active_power)

# Plot the graph
hist(y$Global_active_power, breaks=12, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')

# save plot to PNG
dev.copy(png,'plot1.png')
dev.off()
#read in data
unzip(zipfile="exdata-data-household_power_consumption.zip")

dat <- read.table("household_power_consumption.txt",sep=';', header=T, na.strings = "?")

#data for the reuired date only
data <- dat[(dat$Date == '1/2/2007')|(dat$Date =='2/2/2007'),]

#generate a new date time variable
dt <- paste(data$Date,data$Time)
dt <- strptime(dt,"%d/%m/%Y %H:%M:%S")

#variables used in plots
sub1 <- data$Sub_metering_1
sub2 <- data$Sub_metering_2
sub3 <- data$Sub_metering_3
volt <- data$Voltage
grp <- data$Global_reactive_power
gap <- data$Global_active_power


#generating plot
par(mfrow = c(2, 2))
par(mar=c(4,4,2,2))
plot(dt,gap,type='l',xlab='', ylab='Global Active Power')
plot(dt,volt,type='l',xlab='datetime', ylab='Voltage')
plot(dt,sub1,type='l', xlab='',ylab='Energy Submetering')
lines(dt,sub2, type="l", col="red")
lines(dt,sub3, type="l", col="blue")
par("cex")
par(cex= 0.5)
par("cex")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
par(cex= 0.83)
plot(dt,grp,type='l',xlab='datetime', ylab='Global Reactive Power')
dev.copy(png,'plot4.png')
dev.off()




#read in data
unzip(zipfile="exdata-data-household_power_consumption.zip")

dat <- read.table("household_power_consumption.txt",sep=';', header=T, na.strings = "?")

#data for the reuired date only
data <- dat[(dat$Date == '1/2/2007')|(dat$Date =='2/2/2007'),]

#generate a new date time variable
dt <- paste(data$Date,data$Time)
dt <- strptime(dt,"%d/%m/%Y %H:%M:%S")


sub1 <- data$Sub_metering_1
sub2 <- data$Sub_metering_2
sub3 <- data$Sub_metering_3


plot(dt,sub1,type='l', xlab='',ylab='Energy Submetering')
lines(dt,sub2, type="l", col="red")
lines(dt,sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png,'plot3.png')
dev.off()

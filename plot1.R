#read in data
      unzip(zipfile="exdata-data-household_power_consumption.zip")
      files <- list.files
      dat <- read.table("household_power_consumption.txt",sep=';', header=T, na.strings = "?")
      
#data for the reuired date only
      data <- dat[(dat$Date == '1/2/2007')|(dat$Date =='2/2/2007'),]
      
#generate a new date time variable
      dt <- paste(data$Date,data$Time)
      dt <- strptime(dt,"%d/%m/%Y %H:%M:%S")
      

#Power varibal
      gap <- data$Global_active_power
      
#plot
      png("plot1.png", width=480, height=480)
      hist(gap,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
      dev.off()
      
      
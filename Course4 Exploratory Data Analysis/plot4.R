par(mfrow=c(2,2))

powerc<-data.table::fread("household_power_consumption.txt",na.strings = "?")

powerc<-powerc[with(powerc, Date=="1/2/2007"|Date=="2/2/2007"), ]

dateTime <- strptime( paste(powerc$Date,powerc$Time), format= "%d/%m/%Y %H:%M:%S")

with(powerc, {
  plot(dateTime, Global_active_power, xlab = "", ylab = "Global Active Power", type="l")

  plot(dateTime, Voltage, xlab = "datetime", ylab = "Voltage", type="l")

  plot(dateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="l")
  lines(x=dateTime,y=Sub_metering_2,col="red")
  lines(x=dateTime,y=Sub_metering_3,col="blue")
  legend("topright",lty=1,bty ="N",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  plot(dateTime, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="l")
  
  }) 

dev.copy(png, file = "plot4.png") 

dev.off() 
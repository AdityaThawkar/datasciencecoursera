powerc<-data.table::fread("household_power_consumption.txt",na.strings = "?")

powerc<-powerc[with(powerc, Date=="1/2/2007"|Date=="2/2/2007"), ]

dateTime <- strptime( paste(powerc$Date,powerc$Time), format= "%d/%m/%Y %H:%M:%S")

with(powerc,{
  plot(dateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="l")
  lines(dateTime,Sub_metering_2,col="red")
  lines(dateTime,Sub_metering_3,col="blue")
  })
legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "plot3.png") 

dev.off() 
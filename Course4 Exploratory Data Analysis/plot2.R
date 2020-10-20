powerc<-data.table::fread("household_power_consumption.txt",na.strings = "?")

powerc<-powerc[with(powerc, Date=="1/2/2007"|Date=="2/2/2007"), ]

dateTime <- strptime( paste(powerc$Date,powerc$Time), format= "%d/%m/%Y %H:%M:%S")

with(powerc, plot(dateTime, Global_active_power, xlab = "", ylab = "Global Active Power  (killowatts)", type="l")) 

dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file

dev.off() 
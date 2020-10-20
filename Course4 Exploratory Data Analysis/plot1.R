powerc<-data.table::fread("household_power_consumption.txt",na.strings = "?")

powerc[,Global_active_power:=lapply(.SD,as.numeric),.SDcols=c("Global_active_power")]

powerc[,Date:=lapply(.SD,as.Date,"%d/%m/%Y"),.SDcols=c("Date")]

powerc<-powerc[(Date>="2007-02-01") & (Date<="2007-02-02")]

hist(powerc$Global_active_power, col = "red", xlab = "Global Active Power (killowatts)", main = "Global Active Power")

dev.copy(png, file = "plot1.png") 

dev.off()

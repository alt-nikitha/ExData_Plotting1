fulldata<-read.table("household_power_consumption.txt", sep =";", header = TRUE, dec =".")
filtereddates<-fulldata %>% filter(Date=="1/2/2007" | Date=="2/2/2007")
Sub_metering_1=as.numeric(filtereddates$Sub_metering_1)
Sub_metering_2=as.numeric(filtereddates$Sub_metering_2)
Sub_metering_3=as.numeric(filtereddates$Sub_metering_3)
globalAP=as.numeric(filtereddates$Global_active_power)
voltage=as.numeric(filtereddates$Voltage)
globalRP=as.numeric(filtereddates$Global_reactive_power)
datetime <- strptime(paste(filtereddates$Date,filtereddates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png(file="plot4.png",width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime,globalAP,ylab="Global Active Power (kilowatts)",xlab="",type="l")
plot(datetime,voltage,ylab="Voltage",xlab="datetime",type="l")

plot(datetime,Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime,globalRP,ylab="Global_reactive_power",xlab="datetime",type="l")

dev.off()
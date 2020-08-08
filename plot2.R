fulldata<-read.table("household_power_consumption.txt", sep =";", header = TRUE, dec =".")
filtereddates<-fulldata %>% filter(Date=="1/2/2007" | Date=="2/2/2007")
globalAP=as.numeric(filtereddates$Global_active_power)
datetime <- strptime(paste(filtereddates$Date,filtereddates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png(file="plot2.png",width=480, height=480)
plot(datetime,globalAP,ylab="Global Active Power (kilowatts)",type="l")
dev.off()
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_meter_1<-as.numeric(subSetData$Sub_metering_1)
sub_meter_2<-as.numeric(subSetData$Sub_metering_2)
sub_meter_3<-as.numeric(subSetData$Sub_metering_3)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)

png("plot4.png",height = 480,width=480)
par(mfrow=c(2,2))
plot(datetime,globalActivePower, type="l",xlab = "", ylab="Global Active Power (kilowatts)")

plot(datetime,voltage,type="l",xlab = "", ylab="Voltage")

plot(datetime, sub_meter_1,type="l",col = "blue",ylab="Energy sub metering",xlab="")
lines(datetime, sub_meter_2, type="l", col="red")
lines(datetime, sub_meter_3, type="l", col="green")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=1, lwd=2.5,col=c("blue","red","green"))

plot(datetime,globalReactivePower,type="l",xlab = "", ylab="Global reactive power ")
dev.off()
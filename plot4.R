table<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
key1<-table[,1]=="1/2/2007"
key2<-table[,1]=="2/2/2007"
subset<-table[key1|key2,]
subset$Date<-strptime(paste(subset$Date,subset$Time), "%d/%m/%Y %H:%M:%S")
png(filename="plot4.png")
par(mfrow=c(2,2))
with(subset,{
    plot(Date,Global_active_power,
         xlab="",ylab="Global active power",type="l")
    plot(Date,Voltage,xlab="datetime",ylab="Voltage",type="l")
    plot(Date,Sub_metering_1,main="",
         xlab="",ylab="Energy sub metering",type="n")
    lines(Date,Sub_metering_1,col="black")
    lines(Date,Sub_metering_2,col="red")
    lines(Date,Sub_metering_3,col="blue")    
    legend("topright",lwd=1,col=c("black","red","blue"),
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
    plot(subset$Date,subset$Global_reactive_power,
         xlab="datetime",ylab="Global_reactive_power",type="l")
})
dev.off()
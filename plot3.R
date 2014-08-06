table<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
key1<-table[,1]=="1/2/2007"
key2<-table[,1]=="2/2/2007"
subset<-table[key1|key2,]
subset$Date<-strptime(paste(subset$Date,subset$Time), "%d/%m/%Y %H:%M:%S")
png(filename="plot3.png")
with(subset,plot(Date,Sub_metering_1,main="",
                 xlab="",ylab="Energy sub metering",type="n"))
with(subset,lines(Date,Sub_metering_1,col="black"))
with(subset,lines(Date,Sub_metering_2,col="red"))
with(subset,lines(Date,Sub_metering_3,col="blue"))
legend("topright",lwd=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
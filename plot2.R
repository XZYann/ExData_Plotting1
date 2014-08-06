table<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
key1<-table[,1]=="1/2/2007"
key2<-table[,1]=="2/2/2007"
subset<-table[key1|key2,]
subset$Date<-strptime(paste(subset$Date,subset$Time), "%d/%m/%Y %H:%M:%S")
png(filename="plot2.png")
plot(subset$Date,subset[,3],xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()
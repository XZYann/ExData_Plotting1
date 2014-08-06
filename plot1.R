table<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")
key1<-table[,1]=="1/2/2007"
key2<-table[,1]=="2/2/2007"
subset<-table[key1|key2,]
png(filename="plot1.png")
hist(subset[,3],col="Red",
     xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
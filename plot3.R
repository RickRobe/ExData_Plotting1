## Read all of original data, replacing ? with NA
epc<-read.delim("household_power_consumption.txt",sep=";", na.strings="?", header=TRUE)
## Convert time to r native time type
dts<-paste(epc$Date,epc$Time, sep = " ")
epc$Time<-strptime(dts, format="%d/%m/%Y %H:%M:%S")
rm(dts)
## Convert date to r native date type
epc$Date<-as.Date(epc$Date, format="%d/%m/%Y")
## Identify subset of interest
epc.interest<-subset(epc, Date >'2007-01-31' & Date < '2007-02-03')
rm(epc)
attach(epc.interest)

## Create empty plot mat with axes
par(mfrow=c(1,1))
plot(Time, Sub_metering_1,type="n", ylab="Energy sub metering", xlab="")
## Add first line
lines(Time, Sub_metering_1)
## Add and color 2nd line
par(col='red')
lines(Time,Sub_metering_2)
## add and color 3rd line
par(col='blue')
lines(Time, Sub_metering_3)
## add legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       text.col="black", lwd=1, col=c("black","red","blue"))

## export graph to png file
dev.copy(png, file="plot3.png")
dev.off()
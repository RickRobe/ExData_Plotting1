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

## Create 2X2 plot column matrix
par(mfcol = c(2,2), mar=c(5.1,5.1,2.1,5.1), cex=.50, col="black")
## Upper left = plot2 from earlier exercise
plot(Time,Global_active_power, type='n', ylab="Global Active Power", xlab = '')
lines(Time, Global_active_power)
## Lower left = plot3 from earlier exercise without the border around the legend
plot(Time, Sub_metering_1,type="n", ylab="Energy sub metering", xlab="")
lines(Time, Sub_metering_1)
par(col='red')
lines(Time,Sub_metering_2)
par(col='blue')
lines(Time, Sub_metering_3)
par(col='black')
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       text.col="black", lwd=1, col=c("black","red","blue"), bty='n')
## Upper right
plot(Time,Voltage, type='n', ylab="Voltage", xlab = 'datetime', col="black")
lines(Time, Voltage)
## Lower right
plot(Time, Global_reactive_power, type='n',  xlab = 'datetime', col="black")
lines(Time, Global_reactive_power)

## Export graphic to PNG file
dev.copy(png,"plot4.png")
dev.off()
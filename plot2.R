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
par(mfcol=c(1,1),col='black')
plot(Time,Global_active_power, type='n', ylab="Global Active Power (kilowatts)", xlab = '')
## Add line
lines(Time, Global_active_power)

## export graph to png file
dev.copy(png,file="plot2.png")
dev.off()
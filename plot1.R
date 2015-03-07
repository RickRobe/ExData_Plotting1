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

# Create histogram with appropriate labels and colors
hist(Global_active_power, col="red", main = "Global Active Power", 
     xlab="Global Active Power (kilowatts)" )

## export graph to png file
dev.copy(png,file="plot1.png")
dev.off()
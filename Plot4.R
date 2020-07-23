#code for reading the file
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#Date conversion
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

#Subsetting the data frame 
data1<-subset(data,Date=="2007-02-01" | Date=="2007-02-02")

#Adding Datetime column
library(lubridate)
data1$Datetime<-strptime(paste(data1$Date,data1$Time),format="%Y-%m-%d %H:%M:%S")

#Creating png file for the plot & Actual plot code
png("Plot4.png",width=480,height = 480)
par(mfrow=c(2,2))
with(data1,plot(Datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
with(data1,plot(Datetime,Voltage,type="l",xlab="Datetime",ylab="Voltage"))
with(data1,plot(Datetime,Sub_metering_1,type="l",ylab="Energy sub metering"))
lines(data1$Datetime,data1$Sub_metering_2,col="red")
lines(data1$Datetime,data1$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))
with(data1,plot(Datetime,Global_reactive_power,type="l",xlab="Datetime",ylab="Global_reactive_power"))
dev.off()

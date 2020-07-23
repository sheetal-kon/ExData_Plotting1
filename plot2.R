#code for reading the file
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#Date conversion
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

#Subsetting the data frame 
data1<-subset(data,Date=="2007-02-01" | Date=="2007-02-02")

#Adding Datetime column
install.packages("lubridate")
library(lubridate)
data1$Datetime<-strptime(paste(data1$Date,data1$Time),format="%Y-%m-%d %H:%M:%S")

#Creating png file for the plot & Actual plot code
png("Plot2.png",width=480,height = 480)
with(data1,plot(Datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

dev.off()

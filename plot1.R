#code for reading the file

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#Date conversion

data$Date<-as.Date(data$Date,format="%d/%m/%Y")
#data$Time<-strptime(data$Time,format="%H:%M:%S")
#Subsetting the data frame 
data1<-subset(data,Date=="2007-02-01" | Date=="2007-02-02")

#Creating png file for the plot & Actual plot code
png("Plot1.png",width=480,height = 480)
hist(data1$Global_active_power,xlab="Global Active Power(kilowatts)",col="red",main="Golobal Active Power")
dev.off()

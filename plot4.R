if(!file.exists("household_power_consumption.txt")){
  fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileurl,destfile="eps.zip")
  unzip("eps.zip")}
epc <- read.table("household_power_consumption.txt", header = TRUE,sep=";",stringsAsFactors = F)
epcsub<-subset(epc,Date=="1/2/2007" | Date=="2/2/2007")
library(dplyr)
epcsub<-mutate(epcsub,datetime=as.POSIXct(paste(Date," ",Time),format="%d/%m/%Y %H:%M:%S"))
png("plot4.png")
par(mfrow=c(2,2),mar=c(3,4,4,4))
with(epcsub,plot(datetime,as.numeric(Global_active_power),type="l",ylab="Global Active Power"))
with(epcsub,plot(datetime,Voltage,type="l",ylab="Voltage"))
with(epcsub,plot(epcsub$datetime,epcsub$Sub_metering_1,type="n",ylab="Energy sub metering"))
points(epcsub$datetime,epcsub$Sub_metering_1,type="l",col="black")
points(epcsub$datetime,epcsub$Sub_metering_2,type="l",col="red")
points(epcsub$datetime,epcsub$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2,bty ="n")
with(epcsub,plot(datetime,Global_reactive_power,type="l",ylab="Global_reactive_power"))
dev.off()
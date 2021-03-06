if(!file.exists("household_power_consumption.txt")){
  fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileurl,destfile="eps.zip")
  unzip("eps.zip")}
epc <- read.table("household_power_consumption.txt", header = TRUE,sep=";",stringsAsFactors = F)
epcsub<-subset(epc,Date=="1/2/2007" | Date=="2/2/2007")
library(dplyr)
epcsub<-mutate(epcsub,datetime=as.POSIXct(paste(Date," ",Time),format="%d/%m/%Y %H:%M:%S"))
png("plot2.png")
par(mar=c(3,4,4,4))
plot(epcsub$datetime,as.numeric(epcsub$Global_active_power),type="l",ylab="Global Active Power (kilowatts)")
dev.off()
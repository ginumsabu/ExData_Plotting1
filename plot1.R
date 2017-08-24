if(!file.exists("household_power_consumption.txt")){
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile="eps.zip")
unzip("eps.zip")}
epc <- read.table("household_power_consumption.txt", header = TRUE,sep=";",stringsAsFactors = F)
epcsub<-subset(epc,Date=="1/2/2007" | Date=="2/2/2007")
png("plot1.png")
hist(as.numeric(epcsub$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
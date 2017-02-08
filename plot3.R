data <- read.table("household_power_consumption.txt", sep=";", header=T,stringsAsFactors=FALSE)
data$datetime<-paste(data$Date,data$Time,sep=" ")
data$datetime<-strptime(data$datetime,"%d/%m/%Y %H:%M:%S")
data$Time<-strptime(data$Time,"%H:%M:%S") #convert time from char
data$Date<-as.Date(data$Date,"%d/%m/%Y") #convert date from char
datasub<-subset(data,data$Date>="2007-02-01" & data$Date<="2007-02-02")
datasub$Global_active_power<-as.numeric(datasub$Global_active_power)
datasub$Sub_metering_1<-as.numeric(datasub$Sub_metering_1)
datasub$Sub_metering_2<-as.numeric(datasub$Sub_metering_2)
png(filename="plot3.png",width=480,height=480)
plot(datasub$datetime,datasub$Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering") #plot graphs
lines(datasub$datetime,datasub$Sub_metering_2,col="red")
lines(datasub$datetime,datasub$Sub_metering_3,col="blue")
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty = 1)
dev.off()


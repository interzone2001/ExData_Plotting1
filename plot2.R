data <- read.table("household_power_consumption.txt", sep=";", header=T,stringsAsFactors=FALSE)
data$datetime<-paste(data$Date,data$Time,sep=" ")
data$datetime<-strptime(data$datetime,"%d/%m/%Y %H:%M:%S")
data$Time<-strptime(data$Time,"%H:%M:%S") #convert time from char
data$Date<-as.Date(data$Date,"%d/%m/%Y") #convert date from char
datasub<-subset(data,data$Date>="2007-02-01" & data$Date<="2007-02-02")
datasub$Global_active_power<-as.numeric(datasub$Global_active_power)
png(filename="plot2.png",width=480,height=480)
plot(datasub$datetime,datasub$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()


data <- read.table("household_power_consumption.txt", sep=";", header=T,stringsAsFactors=FALSE)
data$Time<-strptime(data$Time,"%H:%M:%S") #convert time from char
data$Date<-as.Date(data$Date,"%d/%m/%Y") #convert date from char
datasub<-subset(data,data$Date>="2007-02-01" & data$Date<="2007-02-02")
datasub$Global_active_power<-as.numeric(datasub$Global_active_power)
png(filename="plot1.png",width=480,height=480)
hist(datasub$Global_active_power,col="red",breaks=12,main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

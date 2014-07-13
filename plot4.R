##Load data
household_power_consumption <- read.csv("~/Dropbox/Current Documents/Coursera/Coursera_R/household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption_feb_1_2<-subset(household_power_consumption, as.Date(Date) >= '2007-02-01' & as.Date(Date) <= '2007-02-02') 
#Merge time and date
household_power_consumption_feb_1_2$datetime<-paste(household_power_consumption_feb_1_2$Date,household_power_consumption_feb_1_2$Time,sep=" ")
household_power_consumption_feb_1_2$datetime<-strptime(household_power_consumption_feb_1_2$datetime, format="%Y-%m-%d %H:%M:%S")
#plot and output
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2),mar=c(4,4,2,1),cex=0.7)
plot(household_power_consumption_feb_1_2$datetime,household_power_consumption_feb_1_2$Global_active_power, type="l", xlab="", ylab="Global Active Power", main="",yaxp=c(0,6,3))
plot(household_power_consumption_feb_1_2$datetime,household_power_consumption_feb_1_2$Voltage, type="l",xlab="datetime",ylab="Voltage")
plot(household_power_consumption_feb_1_2$datetime,household_power_consumption_feb_1_2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", main="",col="black",yaxp=c(0,30,3))
lines(household_power_consumption_feb_1_2$datetime,household_power_consumption_feb_1_2$Sub_metering_2, type="l", xlab="",col="red")
lines(household_power_consumption_feb_1_2$datetime,household_power_consumption_feb_1_2$Sub_metering_3, type="l", xlab="",col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,col=c("black", "red", "blue"),bty="n")
plot(household_power_consumption_feb_1_2$datetime,household_power_consumption_feb_1_2$Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
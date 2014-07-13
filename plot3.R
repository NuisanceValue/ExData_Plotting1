##Load data
household_power_consumption <- read.csv("~/Dropbox/Current Documents/Coursera/Coursera_R/household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption_feb_1_2<-subset(household_power_consumption, as.Date(Date) >= '2007-02-01' & as.Date(Date) <= '2007-02-02') 
#Merge time and date
household_power_consumption_feb_1_2$Date_Time<-paste(household_power_consumption_feb_1_2$Date,household_power_consumption_feb_1_2$Time,sep=" ")
household_power_consumption_feb_1_2$Date_Time<-strptime(household_power_consumption_feb_1_2$Date_Time, format="%Y-%m-%d %H:%M:%S")
#plot and output
png("plot3.png",width=480,height=480)
plot(household_power_consumption_feb_1_2$Date_Time,household_power_consumption_feb_1_2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", main="",col="black",yaxp=c(0,30,3))
lines(household_power_consumption_feb_1_2$Date_Time,household_power_consumption_feb_1_2$Sub_metering_2, type="l", xlab="",col="red")
lines(household_power_consumption_feb_1_2$Date_Time,household_power_consumption_feb_1_2$Sub_metering_3, type="l", xlab="",col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,col=c("black", "red", "blue"))
dev.off()
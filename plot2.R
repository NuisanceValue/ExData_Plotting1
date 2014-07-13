##Load data
household_power_consumption <- read.csv("~/Dropbox/Current Documents/Coursera/Coursera_R/household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption_feb_1_2<-subset(household_power_consumption, as.Date(Date) >= '2007-02-01' & as.Date(Date) <= '2007-02-02') 
#Merge time and date
household_power_consumption_feb_1_2$Date_Time<-paste(household_power_consumption_feb_1_2$Date,household_power_consumption_feb_1_2$Time,sep=" ")
household_power_consumption_feb_1_2$Date_Time<-strptime(household_power_consumption_feb_1_2$Date_Time, format="%Y-%m-%d %H:%M:%S")
#plot and output
png("plot2.png",width=480,height=480)
plot2<-plot(household_power_consumption_feb_1_2$Date_Time,household_power_consumption_feb_1_2$Global_active_power, type="l", xlab="", ylab="Global Active Power", main="",yaxp=c(0,6,3))
dev.off()

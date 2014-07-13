##Load data
household_power_consumption <- read.csv("~/Dropbox/Current Documents/Coursera/Coursera_R/household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption_feb_1_2<-subset(household_power_consumption, as.Date(Date) >= '2007-02-01' & as.Date(Date) <= '2007-02-02') 
par(cex=0.8,cex.main=0.95,cex.lab=0.95,cex.axis=0.95)
png("plot1.png",width=480,height=480)
plot1<-hist(household_power_consumption_feb_1_2$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
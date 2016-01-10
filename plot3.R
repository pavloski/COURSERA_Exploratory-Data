## import the data
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";")

## select data for specific dates
library(dplyr)
data<-filter(household_power_consumption, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
data$NewDate <- paste(data$Date, data$Time)
data$NewDate<-strptime(data$NewDate, format = "%Y-%m-%d %H:%M:%S")

## convert to numeric
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)

## make the plot
plot(data$NewDate, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(data$NewDate, data$Sub_metering_3, col="blue", type="l")
points(data$NewDate, data$Sub_metering_2, col="red", type="l")
legend("topright", pch ="__" ,col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


## save the plot into a pgn file
dev.copy(png, file = "plot3.png")
dev.off()
## select data for specific dates
library(dplyr)
data<-filter(household_power_consumption, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
data$NewDate <- paste(data$Date, data$Time)
data$NewDate<-strptime(data$NewDate, format = "%Y-%m-%d %H:%M:%S")

## convert to numeric
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Voltage<-as.numeric(data$Voltage)
data$Global_active_power<-as.numeric(data$Global_active_power)

## make the plot


par(mfrow = c(2,2))
par(mar=c(2,1,1,1))

## plot 1
plot(data$NewDate, data$Global_active_power, type = "l", ylab = "GLOBAL ACTIVE POWER (kilowats)")

## plot 2
plot(data$NewDate, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

## plot 3
plot(data$NewDate, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(data$NewDate, data$Sub_metering_3, col="blue", type="l")
points(data$NewDate, data$Sub_metering_2, col="red", type="l")
legend("topright", pch ="__" ,col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

## plot 4
plot(data$NewDate, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power")

## save the plot into a pgn file
dev.copy(png, file = "plot4.png")
dev.off()
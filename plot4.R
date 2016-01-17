## load libraries
library(dplyr)

## import the data
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt",
                                        header = TRUE, 
                                        sep = ";", 
                                        na.strings="?",
                                        stringsAsFactors=FALSE)

## select data for specific dates
household_power_consumption$Date<-as.Date(household_power_consumption$Date, 
                                          "%d/%m/%Y")

data<-filter(household_power_consumption, 
             Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

data$Date <- paste(data$Date, 
                   data$Time)

data$Date<-strptime(data$Date, 
                    format = "%Y-%m-%d %H:%M:%S")

## convert variable to numeric 

data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
data$Voltage<-as.numeric(data$Voltage)
data$Global_active_power<-as.numeric(data$Global_active_power)

## open the file
png("plot4.png", 480, 480)

par(mfrow = c(2,2))
par(mar=c(5,5,2,2))

## plot 1
plot(data$Date, 
     data$Global_active_power, 
     type = "l", 
     ylab = "GLOBAL ACTIVE POWER (kilowats)")

## plot 2
plot(data$Date, 
     data$Voltage, 
     type = "l", 
     ylab = "Voltage", 
     xlab = "datetime")

## plot 3
plot(data$Date, 
     data$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering", 
     xlab = "")
points(data$Date, 
       data$Sub_metering_3, 
       col="blue", 
       type="l")
points(data$Date, 
       data$Sub_metering_2, 
       col="red", 
       type="l")
legend("topright", 
       pch ="__" ,
       col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

## plot 4
plot(data$Date, 
     data$Global_reactive_power, 
     type = "l", 
     xlab="datetime", 
     ylab = "Global_reactive_power")

## close device
dev.off()


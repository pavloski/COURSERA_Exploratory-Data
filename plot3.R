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

## open the file
png("plot3.png", 480, 480)

## make the plot
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


## close device
dev.off()
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

## Change vatiable to numeric 
data$Global_active_power<-as.numeric(data$Global_active_power)

## open the file
png("plot2.png", 480, 480)

## make the plot
plot(data$Date, 
     data$Global_active_power, 
     type = "l", 
     xlab="", 
     ylab = "GLOBAL ACTIVE POWER (kilowatts)")

## close device
dev.off()


## import the data
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";")

## select data for specific dates
library(dplyr)
data<-filter(household_power_consumption, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
data$NewDate <- paste(data$Date, data$Time)
data$NewDate<-strptime(data$NewDate, format = "%Y-%m-%d %H:%M:%S")

## convert to numeric
data$Global_active_power<-as.numeric(data$Global_active_power)

## make the plot
plot(data$NewDate, data$Global_active_power, type = "l", ylab = "GLOBAL ACTIVE POWER (kilowats)")

## save the plot into a pgn file
dev.copy(png, file = "plot2.png")
dev.off()

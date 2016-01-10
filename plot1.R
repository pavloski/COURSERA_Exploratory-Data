## import the data
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";")

## select data for specific dates
library(dplyr)
data<-filter(household_power_consumption, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

## convert to numeric
data$Global_active_power<-as.numeric(data$Global_active_power)

## make the plot
hist(data$Global_active_power, xlab ="Global Active Power (kilowats)", main ="Global Active Power", col="red")

## save the plot into a pgn file
dev.copy(png, file = "plot1.png")
dev.off()

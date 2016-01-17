## load libraries
library(dplyr)
library(data.table)

## import the data
household_power_consumption <- fread("~/Downloads/household_power_consumption.txt",
                                     header = TRUE, 
                                     sep = ";", 
                                     na.strings="?",
                                     stringsAsFactors=FALSE)


## select data for specific dates
household_power_consumption$Date<-as.Date(household_power_consumption$Date, 
                                          "%d/%m/%Y")

data<-filter(household_power_consumption, 
             Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

## open the file
png("plot1.png", 480, 480)

## make the plot
hist(data$Global_active_power, 
     xlab ="Global Active Power (kilowatts)", 
     main ="Global Active Power", 
     col="red")

## close device
dev.off()

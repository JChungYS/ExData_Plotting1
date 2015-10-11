#Assingment 1 Exploratory Data Analysis Oct 2015

#Read data from dataset Electric Power Consumption
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# extrated as 
hpc <- read.delim("household_power_consumption.txt",header=TRUE, sep= ";", na.strings = c("?",""))
hpc$Date <- as.character(hpc$Date)
hdata <- subset(hpc, hpc$Date == "1/2/2007"|hpc$Date == "2/2/2007")
gsub("?", "NA", hdata)
library(dplyr)
hdata$Global_active_power <- as.numeric(hdata$Global_active_power)
HName <- "Global Active Power"
hist(hdata$Global_active_power, col= "red", main = HName, xlab = paste(HName, "(kilowatts)"))
dev.copy(png, file = "plot1.png")  ## Copy my plot to a PNG file
dev.off()  
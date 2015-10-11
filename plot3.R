#plot3.R -- plot3 of Assingment 1 Exploratory Data Analysis Oct 2015

#Read data from dataset Electric Power Consumption
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# extrated as 
library(dplyr)
library(ggplot2)
hpc <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))
hpc <- subset(hpc, hpc$Date == "1/2/2007"|hpc$Date == "2/2/2007")

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$timetemp <- paste(hpc$Date, hpc$Time)
hpc$Time <- strptime(hpc$timetemp, format="%Y-%m-%d %H:%M:%S")  

#hpc$Date <- as.numeric(hpc$Date)
#hpc$Time <- as.numeric(hpc$Time)

j <- ggplot(hpc, aes(x = hpc$Time, fill = hpc$Time)) 
j <- j + geom_line(aes(y=hpc$Sub_metering_1), colour = "black") 
j <- j + geom_line(aes(y=hpc$Sub_metering_3), colour = "blue")  
j <- j + geom_line(aes(y=hpc$Sub_metering_2), colour = "red")    
j <- j + ylab("Energy sub metering")
j <- j + xlab("Thu                                                                     Fri                                                                         sat")
# 
#  
  

  

  
                     
  

ggsave("plot3.png")  ## Copy my plot to a PNG file


#plot3.R -- plot3 of Assingment 1 Exploratory Data Analysis Oct 2015

#Read data from dataset Electric Power Consumption
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# extrated as 
par(mfrow =c(2,2))



library(dplyr)
library(ggplot2)
library(grid)
hpc <- tbl_df(read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?","")))
hpc <- subset(hpc, hpc$Date == "1/2/2007"|hpc$Date == "2/2/2007")

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$timetemp <- paste(hpc$Date, hpc$Time)
hpc$Time <- strptime(hpc$timetemp, format="%Y-%m-%d %H:%M:%S")  

#hpc$Date <- as.numeric(hpc$Date)
#hpc$Time <- as.numeric(hpc$Time)

##Need to find mfrow equvalent for ggplot
require(gridExtra)

a <- ggplot(hpc, aes(Time,Global_active_power)) + geom_line() + ylab("Global Active Power (kilowatts)") + xlab("Thu                                         Fri                                                   Sat")
b <- ggplot(hpc, aes(x = Time)) + geom_line(aes(y=hpc$Sub_metering_1), colour = "black") + geom_line(aes(y=hpc$Sub_metering_3), colour = "blue")  + geom_line(aes(y=hpc$Sub_metering_2), colour = "red")+ ylab("Energy sub metering")+ xlab("Thu                                         Fri                                                   Sat")
c <- ggplot(hpc, aes(Time,Voltage)) + geom_line()+ xlab("datetime")
d <- ggplot(hpc, aes(Time, Global_reactive_power)) + geom_line() + xlab("datetime") 

grid.arrange(a,c,b,d, ncol=2, nrow=2)
 
png("plot4.png")
grid.arrange(a,c,b,d)
dev.off()



ggsave("plot4.png", arrangeGrob(a,c,b,d))  ## Copy my plot to a PNG file



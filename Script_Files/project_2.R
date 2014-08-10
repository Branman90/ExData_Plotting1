#project 1 from Coursera Data Analysis class
library(lubridate)

pD <- read.table("household_power_consumption.txt", sep=";", header=T, dec=".", na.strings="?")
pD$Date <- dmy(pD$Date)
pD$Date <- as.Date(pD$Date)

pD$DateTime <- strptime(paste(pD$Date, pD$Time), "%Y-%m-%d %H:%M:%S")

power <- pD[(pD$Date >= "2007-02-01" & pD$Date <= "2007-02-02"),]
power$Global_active_power <- as.numeric(power$Global_active_power, na.rm=T)
power$Global_reactive_power <- as.numeric(power$Global_reactive_power, na.rm=T)

#### Plot #2
plot(power$DateTime, power$Global_active_power, type="l",col='black',xlab="",
     ylab= "Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", width=480, height =480)
dev.off()


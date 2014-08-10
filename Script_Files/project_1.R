#project 1 from Coursera Data Analysis class
library(lubridate)

pD <- read.table("household_power_consumption.txt", sep=";", header=T, dec=".", na.strings="?")
pD$Date <- dmy(pD$Date)
pD$Date <- as.Date(pD$Date)

power <- pD[(pD$Date >= "2007-02-01" & pD$Date <= "2007-02-02"),]

#### Plot #1
hist(power$Global_active_power, col='red', main="Global Active Power", xlab= "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height =480)
dev.off()


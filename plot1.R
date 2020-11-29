library(lubridate)

# load data into memory
x <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
x$Date <- dmy(x$Date)
x <- subset(x, Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"))

png("plot1.png")
power <- as.numeric(x$Global_active_power)
hist(power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

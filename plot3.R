x <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
x$Time <- strptime(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S")
x <- subset(x, Time >= "2007-02-01 00:00" & Time < "2007-02-03 00:00")

locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME","English")

png("plot3.png")

plot(x$Time, x$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(x$Time, x$Sub_metering_2, col="red")
lines(x$Time, x$Sub_metering_3, col="blue")

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lwd=1)
dev.off()
Sys.setlocale("LC_TIME", locale)

x <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
x$Time <- strptime(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S")
x <- subset(x, Time >= "2007-02-01 00:00" & Time <= "2007-02-03 00:00")

locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME","English")
x$WDay <- weekdays(x$Time, abbreviate=TRUE)
Sys.setlocale("LC_TIME", locale)

png("plot3.png")

plot(x$Sub_metering_1, type="l", xaxt="n", xlab="", ylab="Energy sub metering")
lines(x$Sub_metering_2, col="red")
lines(x$Sub_metering_3, col="blue")

axis(1, at=c(0, nrow(x)/2, nrow(x)), unique(x$WDay))

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lwd=1)
dev.off()

x <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
x$Time <- strptime(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S")
x <- subset(x, Time >= "2007-02-01 00:00" & Time <= "2007-02-03 00:00")

locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME","English")
x$WDay <- weekdays(x$Time, abbreviate=TRUE)
Sys.setlocale("LC_TIME", locale)

png("plot2.png")
plot(x$Global_active_power, type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(0, nrow(x)/2, nrow(x)), unique(x$WDay))

dev.off()

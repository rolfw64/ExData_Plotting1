x <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
x$Time <- strptime(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S")
x <- subset(x, Time >= "2007-02-01 00:00" & Time < "2007-02-03 00:00")

locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME","English")
png("plot2.png")
plot(x$Time, x$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
Sys.setlocale("LC_TIME", locale)



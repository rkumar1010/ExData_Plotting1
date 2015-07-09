## Plot4

d = read.table("./household_power_consumption.txt", sep=";", fill=FALSE, strip.white=TRUE, header=TRUE)
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d <- subset(d, Date >= "2007-02-01" & Date <= "2007-02-02")
d$Global_active_power <- as.numeric(as.character(d$Global_active_power))
d$Global_reactive_power <- as.numeric(as.character(d$Global_reactive_power))
d$Voltage <- as.numeric(as.character(d$Voltage))
d$Global_intensity <- as.numeric(as.character(d$Global_intensity))
d$Sub_metering_1 <- as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2 <- as.numeric(as.character(d$Sub_metering_2))
d$Sub_metering_3 <- as.numeric(as.character(d$Sub_metering_3))
datetime <- strptime(paste(d$Date, d$Time, sep=" "), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, d$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, d$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, d$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, d$Sub_metering_2, type="l", col="red")
lines(datetime, d$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, d$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

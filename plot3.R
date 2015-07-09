## Plot3

d = read.table("./household_power_consumption.txt", sep=";", fill=FALSE, strip.white=TRUE, header=TRUE)
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d <- subset(d, Date >= "2007-02-01" & Date <= "2007-02-02")
d$Sub_metering_1 <- as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2 <- as.numeric(as.character(d$Sub_metering_2))
d$Sub_metering_3 <- as.numeric(as.character(d$Sub_metering_3))

datetime <- strptime(paste(d$Date, d$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(datetime, d$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, d$Sub_metering_2, type="l", col="red")
lines(datetime, d$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

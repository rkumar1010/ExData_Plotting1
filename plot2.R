## Plot2

d = read.table("./household_power_consumption.txt", sep=";", fill=FALSE, strip.white=TRUE, header=TRUE)
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d <- subset(d, Date >= "2007-02-01" & Date <= "2007-02-02")
d$Global_active_power <- as.numeric(as.character(d$Global_active_power))

datetime <- strptime(paste(d$Date, d$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, d$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

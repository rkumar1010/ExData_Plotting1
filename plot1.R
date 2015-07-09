## Plot1

d = read.table("./household_power_consumption.txt", sep=";", fill=FALSE, strip.white=TRUE, header=TRUE)
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d <- subset(d, Date >= "2007-02-01" & Date <= "2007-02-02")
d$Global_active_power <- as.numeric(as.character(d$Global_active_power))

png("plot1.png", width=480, height=480)
hist(d$Global_active_power, col="RED", main = paste("Global Active Power"), xlab=paste("Global Active Power(kilowatts)"))
dev.off()

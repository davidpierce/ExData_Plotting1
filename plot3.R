# read.power(file)
# Reads the household electric power consumption format.
read.power <- function(file) {
    columns <- c(rep("character", 2), rep("numeric", 7))
    power <- read.table(file, header=TRUE, sep=";", colClasses=columns)
    power$Date <- as.Date(power$Date, "%d/%m/%Y")
    power$Time <- strptime(paste(power$Date, power$Time), "%Y-%m-%d %H:%M:%S")
    return(power)
}

if (!exists("power")) {
    # this file has the 2007 Feb 1-2 subset of household_power_consumption.txt
    power <- read.power("household_power_consumption_subset_2007_feb_1_2.txt")
}

png("plot3.png")
plot(power$Time, power$Sub_metering_1, type="l", col="black", ylab="Energy sub metering")
lines(power$Time, power$Sub_metering_2, col="red")
lines(power$Time, power$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"))
dev.off()

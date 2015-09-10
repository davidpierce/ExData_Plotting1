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

png("plot1.png")
hist(power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

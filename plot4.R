## Import the content of the power consumption txt file into R
consumption <- read.table (file="household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")

## Reformatting the Date observition from character to date
consumption$Date <- as.Date (consumption$Date, format = "%d/%m/%Y")

## Retaining only the observations starting on 2007-02-01
subset <- consumption[consumption$Date >= "2007-02-01",]

## Removing the original data from memory
rm(consumption)

## Filtering observations after 2007-02-02
subset <- subset[subset$Date <= "2007-02-02",]

## Creating a time stamp by using date + time
time <- strptime(paste (subset$Date, subset$Time), format="%Y-%m-%d %H:%M:%S")

## Creating the plot to a png device
png(file = "plot4.png", width = 400, height = 400, bg = "white")
par(mfrow=c(2,2)) 
plot (time, subset$Global_active_power, col='black', ylab ='Global Active Power', xlab='', type='l')
plot (time, subset$Voltage, col='black', ylab ='Voltage', xlab='datetime', type='l')
plot (time, subset$Sub_metering_1, col='black', type = 'l', ylab ='Energy sub metering', xlab = '')
points (time, subset$Sub_metering_2, col='red', type = 'l')
points (time, subset$Sub_metering_3, col='blue', type = 'l')
legend ('topright', legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, box.lwd = 0, cex =0.7)
plot (time, subset$Global_reactive_power, col='black', ylab = 'Global_reactive_power',xlab='datetime', type='l')
dev.off()

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
png(file = "plot2.png", width = 400, height = 400, bg = "white")
plot(time, subset$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatts)', type ='l')
dev.off()

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

## Creating the plot to a png device
png(file = "plot1.png", width = 400, height = 400, bg = "white")
hist(subset$Global_active_power, col = "red", xlab = 'Global Active Power (kilowatts)', main='Global Active Power')
dev.off()

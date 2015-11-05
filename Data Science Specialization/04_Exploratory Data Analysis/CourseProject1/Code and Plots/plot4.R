## Code assumes energy data has been downloaded and unzipped
## from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Set working directory and read in data
## Values are seperated by ";"
setwd("C:/Users/eayres/Desktop")
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
col <- names(df)

## Replace df with times starting on 1 Feb 2007. Include the following 2880 rows (i.e., 2 days). Reapply column names
df <- read.table("household_power_consumption.txt", sep=";", na.strings=c("NA","?"), skip=66637, nrows=2880)
colnames(df) <- c(col)

## Add single column containing date and time and convert to date/time format
df$DatTim = paste(df$Date, df$Time, sep=" ")
df$DatTim <- strptime(df$DatTim, "%d/%m/%Y %H:%M:%S")

## Assign each submeter and date/time to a variable
x <- df$DatTim
y <- df$Global_active_power
y1 <- df$Sub_metering_1
y2 <- df$Sub_metering_2
y3 <- df$Sub_metering_3
y4 <- df$Voltage
y5 <- df$Global_reactive_power

## Make 4 pane png
png("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/04_Exploratory Data Analysis/CourseProject1/Code and Plots/plot4.png", 
    width=480, height=480, units = "px")
par(mar=c(4,4,1,1))

## Set up 2 x 2 grid for plots. Add plots in column order.
par(mfcol=c(2,2))

## top left plot
plot(x, y, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")

## bottom left plot
plot(x, y1, ylab = "Energy sub metering", xlab = "", type = "l") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), 
       lwd = 1, cex = 1, bty = "n")
lines(x, y2, ylab = "Energy sub metering", xlab = "", type = "l", col = "red")
lines(x, y3, ylab = "Energy sub metering", xlab = "", type = "l", col = "blue")

## top right plot
plot(x, y4, ylab = "Voltage", xlab = "datetime", type = "l")

## bottom right plot
plot(x, y5, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

dev.off()





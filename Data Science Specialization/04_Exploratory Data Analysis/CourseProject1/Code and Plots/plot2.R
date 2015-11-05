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

## Assign global active power and date/time to y/x
x <- df$DatTim
y <- df$Global_active_power

## Create line plot of global active power time series
png("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/04_Exploratory Data Analysis/CourseProject1/Code and Plots/plot2.png", 
    width=480, height=480, units = "px")
par(mar=c(4,4,1,1))
plot(x, y, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()

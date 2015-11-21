## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base
## plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years
## 1999, 2002, 2005, and 2008.

### Set working directory and read in the data files
setwd("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/04_Exploratory Data Analysis/CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Calculate the total PM2.5 emissions for each year
PM99 <- sum((subset(NEI, year == "1999"))$Emissions)/1000
PM02 <- sum((subset(NEI, year == "2002"))$Emissions)/1000
PM05 <- sum((subset(NEI, year == "2005"))$Emissions)/1000
PM08 <- sum((subset(NEI, year == "2008"))$Emissions)/1000

## Combine the year and emissions values into vectors
yr <- c(1999, 2002, 2005, 2008)
PM <- cbind(PM99, PM02, PM05, PM08)

## Make png file
png("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/04_Exploratory Data Analysis/CourseProject2/plot1.png", 
    width=480, height=480, units = "px")
par(mar=c(4,4,1,1))
plot(yr, PM, xlab = "Year", ylab = "PM2.5 Emissions (1000 tons)")
dev.off()

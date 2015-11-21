## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999
## to 2008? Use the base plotting system to make a plot answering this question.

### Set working directory and read in the data files
setwd("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/04_Exploratory Data Analysis/CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Calculate the total PM2.5 emissions for Baltimore (fips = 24510) each year
PM99 <- sum((subset(NEI, year == "1999" & fips == "24510"))$Emissions)
PM02 <- sum((subset(NEI, year == "2002" & fips == "24510"))$Emissions)
PM05 <- sum((subset(NEI, year == "2005" & fips == "24510"))$Emissions)
PM08 <- sum((subset(NEI, year == "2008" & fips == "24510"))$Emissions)

## Combine the year and emissions values into vectors
yr <- c(1999, 2002, 2005, 2008)
PM <- cbind(PM99, PM02, PM05, PM08)

## Make png file
png("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/04_Exploratory Data Analysis/CourseProject2/plot2.png", 
    width=480, height=480, units = "px")
par(mar=c(4,4,1,1))
plot(yr, PM, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Baltimore PM2.5 Emissions", pch = 19)
dev.off()

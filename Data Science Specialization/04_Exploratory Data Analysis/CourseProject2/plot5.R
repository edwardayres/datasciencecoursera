## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

### Set working directory and read in the data files
setwd("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/04_Exploratory Data Analysis/CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Get the vehicle 
cars <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
carsSCC <- SCC[cars,]$SCC
carsNEI <- NEI[NEI$SCC %in% carsSCC,]

## Get the emissions data for Baltimore (fips = 24510)
NEI1 <- grepl(24510, carsNEI$fips)
carsNEI <- carsNEI[NEI1,]

## Calculate the total PM2.5 emissions from vehicles for Baltimore (fips = 24510) each year
PM99 <- sum((subset(carsNEI, year == "1999"))$Emissions)
PM02 <- sum((subset(carsNEI, year == "2002"))$Emissions)
PM05 <- sum((subset(carsNEI, year == "2005"))$Emissions)
PM08 <- sum((subset(carsNEI, year == "2008"))$Emissions)

## Combine the year and emissions values into vectors
yr <- c(1999, 2002, 2005, 2008)
PM <- cbind(PM99, PM02, PM05, PM08)

## Make png file
png("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/04_Exploratory Data Analysis/CourseProject2/plot5.png", 
    width=480, height=480, units = "px")
par(mar=c(4,4,1,1))
plot(yr, PM, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Vehicle PM2.5 Emissions for Baltimore", pch = 19)
dev.off()

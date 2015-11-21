## Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

### Set working directory and read in the data files
setwd("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/04_Exploratory Data Analysis/CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Find coal combustion sources in SCC
coal <- grepl("*Comb.*Coal", SCC$EI.Sector)
coal1 <- SCC[coal,]

## Get the emissions data for the rows relating to coal combustion
emissions <- NEI[(NEI$SCC %in% coal1$SCC), ]

## Calculate the total PM2.5 emissions from coal combustion for each year
coal99 <- sum((subset(emissions, year == "1999"))$Emissions)
coal02 <- sum((subset(emissions, year == "2002"))$Emissions)
coal05 <- sum((subset(emissions, year == "2005"))$Emissions)
coal08 <- sum((subset(emissions, year == "2008"))$Emissions)

## Combine the year and emissions values into vectors
yr <- c(1999, 2002, 2005, 2008)
PM <- cbind(coal99, coal02, coal05, coal08)

## Make png file
png("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/04_Exploratory Data Analysis/CourseProject2/plot4.png", 
    width=480, height=480, units = "px")
par(mar=c(4,4,1,1))
plot(yr, PM, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "US Coal Combustion PM2.5 Emissions", pch = 19)
dev.off()

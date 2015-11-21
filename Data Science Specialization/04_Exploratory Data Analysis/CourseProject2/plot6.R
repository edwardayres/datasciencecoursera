## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los
## Angeles County, California (fips == 06037). Which city has seen greater changes over time in motor vehicle
## emissions?

### Set working directory and read in the data files
setwd("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/04_Exploratory Data Analysis/CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Get the vehicle 
cars <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
carsSCC <- SCC[cars,]$SCC
carsNEI <- NEI[NEI$SCC %in% carsSCC,]

## Get the emissions data for Baltimore (fips = 24510)
BNEI1 <- grepl(24510, carsNEI$fips)
BcarsNEI <- carsNEI[BNEI1,]

## Get the emissions data for Los Angeles (fips = 06037)
LANEI1 <- grepl(06037, carsNEI$fips)
LAcarsNEI <- carsNEI[LANEI1,]

## Calculate the total PM2.5 emissions from vehicles for Baltimore (fips = 24510) each year
BPM99 <- sum((subset(BcarsNEI, year == "1999"))$Emissions)
BPM02 <- sum((subset(BcarsNEI, year == "2002"))$Emissions)
BPM05 <- sum((subset(BcarsNEI, year == "2005"))$Emissions)
BPM08 <- sum((subset(BcarsNEI, year == "2008"))$Emissions)

## Calculate the total PM2.5 emissions from vehicles for Los Angeles (fips = 06037) each year
LAPM99 <- sum((subset(LAcarsNEI, year == "1999"))$Emissions)
LAPM02 <- sum((subset(LAcarsNEI, year == "2002"))$Emissions)
LAPM05 <- sum((subset(LAcarsNEI, year == "2005"))$Emissions)
LAPM08 <- sum((subset(LAcarsNEI, year == "2008"))$Emissions)

## Combine the year and emissions values into vectors
yr <- c(1999, 2002, 2005, 2008)
PMB <- cbind(BPM99, BPM02, BPM05, BPM08)
PMLA <-cbind(LAPM99, LAPM02, LAPM05, LAPM08) 

## Make png file
png("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/04_Exploratory Data Analysis/CourseProject2/plot6.png", 
    width=480, height=480, units = "px")
par(mar=c(4,4,4,1))
plot(yr, PMB, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Vehicle PM2.5 Emissions for Baltimore 
     and Los Angeles", pch = 19, lwd = 3, type = "l", ylim = c(0, max(PMLA)))
lines(yr, PMLA, col = "blue", lwd = 3)
legend(2004, 5000, c("Baltimore", "Los Angeles"), lty=c(1,1), lwd = c(3,3), col=c("black", "blue") )
dev.off()

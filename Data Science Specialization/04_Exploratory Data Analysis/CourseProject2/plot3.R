## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
## Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a 
## plot answer this question.

### Set working directory and read in the data files
setwd("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/04_Exploratory Data Analysis/CourseProject2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Get the emissions data for Baltimore (fips = 24510)
NEI1 <- grepl(24510, NEI$fips)
NEI <- NEI[NEI1,]

## Calculate the total PM2.5 emissions from point sources for each year
point99 <- sum((subset(NEI, year == "1999" & type == "POINT"))$Emissions)
point02 <- sum((subset(NEI, year == "2002" & type == "POINT"))$Emissions)
point05 <- sum((subset(NEI, year == "2005" & type == "POINT"))$Emissions)
point08 <- sum((subset(NEI, year == "2008" & type == "POINT"))$Emissions)

## Calculate the total PM2.5 emissions from nonpoint sources for each year
npoint99 <- sum((subset(NEI, year == "1999" & type == "NONPOINT"))$Emissions)
npoint02 <- sum((subset(NEI, year == "2002" & type == "NONPOINT"))$Emissions)
npoint05 <- sum((subset(NEI, year == "2005" & type == "NONPOINT"))$Emissions)
npoint08 <- sum((subset(NEI, year == "2008" & type == "NONPOINT"))$Emissions)

## Calculate the total PM2.5 emissions from onroad sources for each year
onroad99 <- sum((subset(NEI, year == "1999" & type == "ON-ROAD"))$Emissions)
onroad02 <- sum((subset(NEI, year == "2002" & type == "ON-ROAD"))$Emissions)
onroad05 <- sum((subset(NEI, year == "2005" & type == "ON-ROAD"))$Emissions)
onroad08 <- sum((subset(NEI, year == "2008" & type == "ON-ROAD"))$Emissions)

## Calculate the total PM2.5 emissions from nonroad sources for each year
nonroad99 <- sum((subset(NEI, year == "1999" & type == "NON-ROAD"))$Emissions)
nonroad02 <- sum((subset(NEI, year == "2002" & type == "NON-ROAD"))$Emissions)
nonroad05 <- sum((subset(NEI, year == "2005" & type == "NON-ROAD"))$Emissions)
nonroad08 <- sum((subset(NEI, year == "2008" & type == "NON-ROAD"))$Emissions)

## Combine the year and emissions values into a dataframe
yr <- c(1999, 2002, 2005, 2008, 1999, 2002, 2005, 2008, 1999, 2002, 2005, 2008, 1999, 2002, 2005, 2008)
type <- c("point", "point", "point", "point", "non-point", "non-point", "non-point", "non-point", "on-road", 
          "on-road", "on-road", "on-road", "non-road", "non-road", "non-road", "non-road")
point <- rbind(point99, point02, point05, point08)
npoint <- rbind(npoint99, npoint02, npoint05, npoint08)
onroad <- rbind(onroad99, onroad02, onroad05, onroad08)
nonroad <- rbind(nonroad99, nonroad02, nonroad05, nonroad08)
emissions <- c(point, npoint, onroad, nonroad)
df <- cbind(type, yr, emissions)
df <- as.data.frame(df)
df$emissions <- as.numeric(paste(df[,3]))

## Make png file
library(ggplot2)
png("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/04_Exploratory Data Analysis/CourseProject2/plot3.png", 
    width=800, height=480, units = "px")
par(mar=c(4,4,1,1))
qplot(yr, emissions, data = df, facets = .~type)
dev.off()

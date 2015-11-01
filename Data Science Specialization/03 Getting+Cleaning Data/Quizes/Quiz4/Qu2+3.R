setwd("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/03 Getting+Cleaning Data/Quizes/Quiz4")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile="gdp.csv", mode="wb")
dateDownloaded <- date()
print(dateDownloaded)

library(data.table)
data <- fread(input="gdp.csv", sep=",")

## remove row that don't include gdp data
data2 <- data[5:194]

## remove commas from gdp and replace with nothing
data3 <- gsub(",", "", data2$V5)

## convert gdp to numeric values, sum them, then divide by number of rows (i.e. 190)
sum(as.numeric(data3))/190

###### Qu3 No. countries whose name starts with "United"
countryNames <- data2$V4
grep("*United",countryNames)
grep("United$",countryNames)
grep("^United",countryNames) ##This one
grep("*United",countryNames)

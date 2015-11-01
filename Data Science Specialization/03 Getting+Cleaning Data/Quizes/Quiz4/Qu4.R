setwd("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/03 Getting+Cleaning Data/Quizes/Quiz4")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile="gdp1.csv", mode="wb")
dateDownloaded <- date()
print(dateDownloaded)

fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl2, destfile="edu.csv", mode="wb")
dateDownloaded <- date()
print(dateDownloaded)


library(data.table)
gdp <- fread(input="gdp1.csv", sep=",")
edu <- fread(input="edu.csv", sep=",")

## remove row that don't include gdp data
gdp2 <- gdp[5:194]

head(gdp2)
head(edu)

## merge gdp2 and edu into 1 table based on country code, exclude non-matches
mergedData <- merge(gdp2,edu,by.x = "V1", by.y = "CountryCode", all=FALSE)

## subset the column containing fiscal year info
FYinfo <- mergedData$`Special Notes`

## Subset special notes containing the text "Fiscal year end: June". Then manually count number of "June"
grep("Fiscal year end: June", FYinfo,value=TRUE)


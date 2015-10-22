setwd("C:/Users/eayres/Documents/Data Science Specialization/03 Getting+Cleaning Data/Quizes/Quiz3")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile="GDP.csv", mode="wb")
dateDownloaded <- date()
print(dateDownloaded)

fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl1, destfile="EDSTATS_Country.csv", mode="wb")
dateDownloaded <- date()
print(dateDownloaded)

library(data.table)
GDP <- fread(input="GDP.csv", sep=",")
GDPclean <- GDP[5:194,]
EDstats <- fread(input="EDSTATS_Country.csv", sep=",")

head(GDPclean)
head(EDstats)

mergedData <- merge(GDPclean,EDstats,by.x = "V1", by.y = "CountryCode", all=FALSE)
mergedData$`Gross domestic product 2012` = as.numeric(as.character(mergedData$`Gross domestic product 2012`))
summary(mergedData[mergedData$Income.Group=="High income: OECD",])

sortData <- mergedData[order(-`Gross domestic product 2012`)]

## Qu4
SUBsortData <- table(sortData$`Income Group` %in% c("High income: OECD", "High income: nonOECD"))
x <- sortData[sortData$`Income Group` %in% c("High income: OECD")]
y <- sortData[sortData$`Income Group` %in% c("High income: nonOECD")]

summary(x$`Gross domestic product 2012`)
summary(y$`Gross domestic product 2012`)

## Qu5
sortData$QuinGroups = cut(sortData$`Gross domestic product 2012`, breaks=quantile(sortData$`Gross domestic product 2012`))
table(sortData$`Income Group`,sortData$`Gross domestic product 2012`)


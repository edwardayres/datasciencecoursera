setwd("C:/Users/eayres/Documents/Data Science Specialization/03 Getting+Cleaning Data/Week3")
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/restaurants.csv")
restData <- read.csv("./data/restaurants.csv")

head(restData,n=3)

quantile(restData$councilDistrict, na.rm=TRUE)

# Make table to summarize data in data frame
table(restData$zipCode, useNA="ifany")

library(reshape2)
head(mtcars)

setwd("C:/Users/eayres/Documents/Data Science Specialization/03 Getting+Cleaning Data/Quizes/Quiz1/")
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url=fileUrl1, destfile="gov_NGAP.xlsx", mode="w")
dateDownloaded <- date()
print(dateDownloaded)
library(xlsx)
rowIndex <- 18:23
colIndx <- 7:15
dat <- read.xlsx(file="gov_NGAP.xlsx",sheetIndex=1,colIndex=colIndx,startRow=18, endRow=23, header=TRUE)
head(dat)

sum(dat$Zip*dat$Ext,na.rm=T) 


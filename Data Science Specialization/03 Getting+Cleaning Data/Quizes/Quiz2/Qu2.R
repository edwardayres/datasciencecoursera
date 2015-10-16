setwd("C:/Users/eayres/Documents/Data Science Specialization/03 Getting+Cleaning Data/Quizes/Quiz2/")
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata/data/ss06pid.csv"
download.file(url=fileUrl1, destfile="fsspid.csv", mode="w")
dateDownloaded <- date()
print(dateDownloaded)

library(data.table)
acs <- fread(input="fsspid.csv", sep=",")

install.packages("sqldf")
library(sqldf)

sqldf("select pwgtp1 from acs")
sqldf("select * from acs where AGEP < 50 and pwgtp1")
sqldf("select * from acs where AGEP < 50")
sqldf("select pwgtp1 from acs where AGEP < 50") 

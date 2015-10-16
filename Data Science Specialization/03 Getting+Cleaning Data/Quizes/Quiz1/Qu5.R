setwd("C:/Users/eayres/Documents/Data Science Specialization/03 Getting+Cleaning Data/Quizes/Quiz1/")
fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata/data/ss06pid.csv"
download.file(url=fileUrl1, destfile="fsspid.csv", mode="w")
dateDownloaded <- date()
print(dateDownloaded)
library(data.table)
DT <- fread(input="fsspid.csv", sep=",")


head(DT)

mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
DT[,mean(pwgtp15),by=SEX]
sapply(split(DT$pwgtp15,DT$SEX),mean)
mean(DT$pwgtp15,by=DT$SEX)
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
tapply(DT$pwgtp15,DT$SEX,mean)

system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))

system.time(DT[,mean(pwgtp15),by=SEX])

system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

system.time(mean(DT$pwgtp15,by=DT$SEX))

system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])

system.time(tapply(DT$pwgtp15,DT$SEX,mean))
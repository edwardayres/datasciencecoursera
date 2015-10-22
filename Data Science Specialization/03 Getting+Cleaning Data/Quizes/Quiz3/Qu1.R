setwd("C:/Users/eayres/Documents/Data Science Specialization/03 Getting+Cleaning Data/Quizes/Quiz3")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="fsspid.csv", mode="w")
dateDownloaded <- date()
print(dateDownloaded)

library(data.table)
data <- fread(input="fsspid.csv", sep=",")

# ACR = 3 means lot >10 acres, AGS = 6 means sold >$10,000 of agricultural products
sort <- data[data$ACR == 3 & data$AGS == 6, ]

data <- transform(data, agricultureLogical = ifelse( data$ACR == 3 & data$AGS == 6, 'TRUE' , 'FALSU' ) )
names(data)  
data$agricultureLogical

which(data$agricultureLogical == TRUE)

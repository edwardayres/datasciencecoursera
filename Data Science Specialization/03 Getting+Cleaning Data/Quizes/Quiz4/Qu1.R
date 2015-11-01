setwd("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/03 Getting+Cleaning Data/Quizes/Quiz4")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="fsspid.csv", mode="w")
dateDownloaded <- date()
print(dateDownloaded)

library(data.table)
data <- fread(input="fsspid.csv", sep=",")

colname <- names(data)
splitcolname <- strsplit(colname, "wgtp")
splitcolname[[123]]

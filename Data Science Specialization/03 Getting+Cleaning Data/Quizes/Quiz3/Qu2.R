setwd("C:/Users/eayres/Documents/Data Science Specialization/03 Getting+Cleaning Data/Quizes/Quiz3")
library("jpeg")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl, destfile="jeff.jpg", mode="wb")

dateDownloaded <- date()
print(dateDownloaded)

photo <- readJPEG("jeff.jpg", native=TRUE)

quantile(photo, c(.30,.80))

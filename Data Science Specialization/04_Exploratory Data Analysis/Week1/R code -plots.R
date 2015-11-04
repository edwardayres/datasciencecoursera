setwd("C:/Users/eayres/Documents/GitHub/datasciencecoursera/Data Science Specialization/04_Exploratory Data Analysis/Week1")
pollution <- read.csv("data/avgpm25.csv", colClasses = c("numeric", "character", "factor", "numeric", "numeric"))

head(pollution)

## did PM ever exceed 12 ug/m3?
## Different methods to test this
summary(pollution$pm25)

boxplot(pollution$pm25, col = "blue")

hist(pollution$pm25, col = "green")
rug(pollution$pm25)

hist(pollution$pm25, col = "green", breaks = 100)
rug(pollution$pm25)

boxplot(pollution$pm25, col = "blue")
abline(h = 12) ### line shows the 12 ug/m3 threshold

hist(pollution$pm25, col = "green", breaks = 100)
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)

barplot(table(pollution$region), col = "wheat", main = "Number of Counties in Each Region")

boxplot(pm25 ~ region, data = pollution, col = "red")

par(mfrow = c(2, 1), mar = c(4, 4, 2, 1))

## scatterplot
with(pollution, plot(latitude, pm25))
abline(h = 12, lwd = 2, lty = 2)

with(pollution, plot(latitude, pm25, col = region))
abline(h = 12, lwd = 2, lty = 2)

par(mfrow = c(2, 1), mar = c(4, 4, 2, 1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "West"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))


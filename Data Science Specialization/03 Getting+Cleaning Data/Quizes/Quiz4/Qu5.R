library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

### number of rows starting with "2012"
Times2012 <- grep("^2012", sampleTimes, value = TRUE)

## find class of dates
class(Times2012)

## convert to "dates" and print head
x = as.Date(Times2012, "%Y-%m-%d")
head(x)

## express dates as days of the week (e.g. monday, tuesday, ...)
y <- weekdays(x)

## subset days that = Monday and count number of rows
z <- grep("Monday", y)

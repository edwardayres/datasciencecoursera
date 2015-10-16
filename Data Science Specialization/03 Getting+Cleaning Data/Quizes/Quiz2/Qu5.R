x <- read.fwf(
  file=url("https://d396qusza40orc.cloudfront.net/getdata/wksst8110.for"),
  skip=4,
  widths=c(12, 7,4, 9,4, 9,4, 9,4))

head(x)
x[,4]
sum(x[,4])

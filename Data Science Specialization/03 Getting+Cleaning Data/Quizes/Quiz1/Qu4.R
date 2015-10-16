library(XML)
fileUrl2 <- "http://d396qusza40orc.cloudfront.net/getdata/data/restaurants.xml"
doc <- xmlTreeParse(fileUrl2,useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

library(data.table)
a <- data.table(xpathSApply(rootNode,"//zipcode",xmlValue))
a[, .N, by=V1]

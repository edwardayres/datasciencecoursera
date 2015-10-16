setwd("C:/Users/eayres/Documents/Data Science Specialization/03 Getting+Cleaning Data/Quizes/Quiz1/")
data <- read.csv("C:/Users/eayres/Documents/Data Science Specialization/03 Getting+Cleaning Data/Quizes/Quiz1/getdata_data_ss06hid.csv")
head(data)
value <- (data$VAL)
bad <- is.na(value)
goodvalue <- value[!bad]
twentyFour <- goodvalue==24
order(twentyFour)





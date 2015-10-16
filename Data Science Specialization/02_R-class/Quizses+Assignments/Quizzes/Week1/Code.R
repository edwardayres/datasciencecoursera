setwd("C:/Users/eayres/Documents/Coursera_R-class/Quizes/Week1")

#Q4
xx <- 4L
class(xx)

#Q4b
n<- 4
class(n)


#Q5
xxx <- c(4,TRUE)
class(xxx)


#Q8b
o <-  list(2, "a", "b", TRUE)
o[[1]]
p <- o[[1]]
class(p)



#Q9
xxxx <- 1:4
yyyy <- 2:3
xxxx+yyyy
class(xxxx+yyyy)

#Q10
zz <- c(17,14,4,5,13,12,10)
zz[zz>10]<-4

#10b
x <- c(3, 5, 1, 10, 12, 6)
x[x %in% 1:5] <- 0



#Q11
read.csv("hw1_data.csv")

#12
x <- read.csv("hw1_data.csv")
x[1:2, ]

#Q13
nrow(x)

#Q14
x[152:153, ]

#15
x[47,1]

#Q16
bad <- is.na(x$Ozone)
nrow(x[bad, ])

#Q17
y <- nrow(x[!bad, ])
y
z <- sum(x$Ozone[!bad])
z
z/y

#Q18
a <- x[c(1,2,4)]
good <- complete.cases(a)
a[good, ][ , ]
a
b <- a[good, ][ , ]
b
c <- subset(b, Ozone>31)
c
d <- subset(c, Temp>90)
d
mean(d$Solar.R)

#Q19
f <- subset(x, Month==6)
f
mean(f$Temp)

#Q20
h <- subset(x, Month==5)
h
i <- subset(h, Ozone<1000000000)
i
max(i$Ozone)





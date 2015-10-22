rankall <- function(outcome, num = "best") {
  x <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Change heart attack, heart failure, and pneumonia columns to numeric
  options(warn=-1) 
  x[, 11] <- as.numeric(x[, 11])
  x[, 17] <- as.numeric(x[, 17])
  x[, 23] <- as.numeric(x[, 23])
  
  if(outcome == "heart attack"){k <- 11
  } else if(outcome == "heart failure"){k <- 17
  } else if(outcome == "pneumonia"){k <- 23
  } else{stop("invalid outcome")}
  
  a <- unique(unlist(x[,7]))
  
  ## Create dataframe
  hospital <- c()
  state <- c()
  
  for(i in 1:54){
    state <- append(state, c(a[i]))
    y <- subset(x, x[,7]==a[i])
    
    if(outcome == "heart attack"){
      yOrder <- y[ order(y[,k],y[,2]), ]
      if(num=="best"){
        b <- 1
      } else if(num=="worst"){
        bad <- is.na(y[,k])
        d <- max(y[,k][!bad])
        b <- which(yOrder[,k]==d)
      } else if(class(num)=="numeric"){
        b <- num
      }
      hospital <- append(hospital, c(yOrder[b,2]))
    } else if(outcome == "heart failure"){
      yOrder <- y[ order(y[,k],y[,2]), ]
      if(num=="best"){
        b <- 1
      } else if(num=="worst"){
        bad <- is.na(y[,k])
        d <- max(y[,k][!bad])
        b <- which(y[,k]==d)
      } else if(class(num)=="numeric"){
        b <- num
      }
      hospital <- append(hospital, c(yOrder[b,2]))
    } else if(outcome == "pneumonia"){
      yOrder <- y[ order(y[,k],y[,2]), ]
      if(num=="best"){
        b <- 1
      } else if(num=="worst"){
        bad <- is.na(y[,k])
        d <- max(y[,k][!bad])
        b <- which(y[,k]==d)
      } else if(class(num)=="numeric"){
        b <- num
      } 
      hospital <- append(hospital, c(yOrder[b,2]))
    } 
    
  }
  mydata <- data.frame(hospital, state)
  mydataOrder <- mydata[ order(mydata[,2]), ]
  mydataOrder
  
}
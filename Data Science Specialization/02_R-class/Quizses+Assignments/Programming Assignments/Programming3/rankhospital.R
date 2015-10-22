rankhospital <- function(state, outcome, num = "best") {

  x <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Change heart attack, heart failure, and pneumonia columns to numeric
  options(warn=-1) 
  x[, 11] <- as.numeric(x[, 11])
  x[, 17] <- as.numeric(x[, 17])
  x[, 23] <- as.numeric(x[, 23])

  y <- subset(x, x[,7]==state)
  
  ## Print "invalid state" if there are no rows for that state
  if(nrow(y)==0){
    stop("invalid state")
  }
  
  if(outcome == "heart attack"){k <- 11}
  if(outcome == "heart failure"){k <- 17}
  if(outcome == "pneumonia"){k <- 23}
  
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
    yOrder[b,2]
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
    yOrder[b,2]
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
    yOrder[b,2]
  } else{stop("invalid outcome")}
  
}

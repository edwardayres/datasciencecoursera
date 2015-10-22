best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate

  x <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Change heart attack, heart failure, and pneumonia columns to numeric
  options(warn=-1) 
  x[, 11] <- as.numeric(x[, 11])
  x[, 17] <- as.numeric(x[, 17])
  x[, 23] <- as.numeric(x[, 23])
  
  ##outcome <- "heart attack"     ## Delete this row once in function
  ##state <- "BB"                 ## Delete this row once in function
  
  y <- subset(x, x[,7]==state)
  
  ## Print "invalid state" if there are no rows for that state
  if(nrow(y)==0){
    stop("invalid state")
  }
  
  if(outcome == "heart attack"){
    z <- y[,11]
    bad <- is.na(z)
    a <- min(z[!bad])
    b <- which(y[,11]==a)
    y[b,2]
  } else if(outcome == "heart failure"){
    z <- y[,17]
    bad <- is.na(z)
    a <- min(z[!bad])
    b <- which(y[,17]==a)
    y[b,2]
  } else if(outcome == "pneumonia"){
    z <- y[,23]
    bad <- is.na(z)
    a <- min(z[!bad])
    b <- which(y[,23]==a)
    y[b,2]
  } else{stop("invalid outcome")}

}

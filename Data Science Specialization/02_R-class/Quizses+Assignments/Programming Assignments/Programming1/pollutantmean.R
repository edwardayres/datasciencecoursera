pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!

  ####Start of my function####
  ##set working directory
  #directory <- "specdata"
  #setwd("C:/Users/eayres/Documents/Coursera_R-class/Quizses+Assignments/Programming Assignments/Programming1/")
  x <- paste("C:/Users/eayres/Documents/Coursera_R-class/Quizses+Assignments/Programming Assignments/Programming1/", directory, sep="/")
  setwd(x)
  
  ##Loop through all the data files
  #id <- 70:72
  datasum <- c()
  datalength <- c()
  for(i in id){
    
    ### change "id" to file name (i.e., 3-digit number & .csv)
    sprintf("%03d.csv", i)
    file <- sprintf("%03d.csv", i)
    
    ### Read in the file(s)
    csvdata <- read.csv(paste0(file), header=TRUE, sep=",")
    head(csvdata)
    
    ##identify pollutant column and data
    #pollutant <- "nitrate"
    if (pollutant == "nitrate"){
      z <- csvdata$nitrate
    } else {
      z <- csvdata$sulfate
    }
    
    ##Remove NAs
    zz <- z[!is.na(z)]
    
    #Calculate mean, sum, and number values
    a <- mean(zz)
    b <- sum(zz)
    c <- length(zz)
    
    ##Printing sum and count of pollutant to files 
    datasum<-append(datasum,c(b))
    datalength<-append(datalength,c(c))
  }
  
  ##Calculating average pollutant
  sum(datasum)/sum(datalength)
}

pollutantmean("specdata", "sulfate", 1:10)

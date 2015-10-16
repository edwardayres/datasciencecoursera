complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases

  ####START of my function
  ## set working directory
  #directory <- "specdata"
  x <- paste("C:/Users/eayres/Documents/Coursera_R-class/Quizses+Assignments/Programming Assignments/Programming1/", directory, sep="/")
  setwd(x)
  
  ##Loop through all the data files
  #id <- 1:2
  siteID <- c()
  nobs <- c()
  for(i in id){
    
    ### change "id" to file name (i.e., 3-digit number & .csv)
    sprintf("%03d.csv", i)
    file <- sprintf("%03d.csv", i)
    
    ### Read in the file(s)
    csvdata <- read.csv(paste0(file), header=TRUE, sep=",")
    head(csvdata)
    
    #write file name to vector
    siteID<-append(siteID,c(i))
    
    #calculating number of complete cases
    good <- complete.cases(csvdata)
    y <- csvdata[good, ]
    z <- nrow(y)
    
    #write file name to vector
    nobs<-append(nobs,c(z))
    
  }
  data <- data.frame(siteID, nobs)
  colnames(data) <- c("id", "nobs")
  data
}

setwd("C:/Users/eayres/Documents/Coursera_R-class/Quizses+Assignments/Programming Assignments/Programming1/")
corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  
  ####START of my function
  ## set working directory
  #directory <- "specdata"
  x <- paste("C:/Users/eayres/Documents/Coursera_R-class/Quizses+Assignments/Programming Assignments/Programming1/", directory, sep="/")
  setwd(x)
  
  ##Loop through all the data files
  #threshold <- 5000
  correlation <- c()
  for(i in 1:332){
    
      ### change "id" to file name (i.e., 3-digit number & .csv)
      #i <- 2
      sprintf("%03d.csv", i)
      file <- sprintf("%03d.csv", i)
    
      ### Read in the file(s)
      csvdata <- read.csv(paste0(file), header=TRUE)
      head(csvdata)
    
      #calculating number of complete cases
      good <- complete.cases(csvdata)
      y <- csvdata[good, ]
      z <- nrow(y)
    
          #determine if number of comoplete cases is greater than threshold
          if(z>threshold){
              a <- cor(y$sulfate, y$nitrate, use="pairwise.complete.obs")
              correlation <- append(correlation, c(a))
          }
    
      }
      as.numeric(correlation)
  correlation  
}
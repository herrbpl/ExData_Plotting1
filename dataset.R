# dataset.R
# Course project 1 for explatory data analysis course
# Siim Aus
# This is common file for loading preformatted dataset


# Download data function
myDownload <- function(filename, fileurl, read=NULL, ...) {
  if(!file.exists("./data")){dir.create("./data")}

  if (!file.exists(filename))
    download.file(fileurl,destfile=filename,method="curl")
  
  if (!is.null(read)) {
    read(filename, ...)
  } else {
    return(TRUE)
  }
  
}



# Extract and load data
householddata <- function() {
  
  filename <- "./data/household_power_consumption.txt"
  
  if (!file.exists(filename)) {
    
    zipfilename <- "./data/household_power_consumption.zip"
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"  
    
    myDownload(zipfilename, url, function(f) {
      library(utils);
      unzip(zipfilename, exdir="./data");
      
    })
  }
  
   
  # extract smaller data set
  library(data.table)
  
  tidyfilename <- "./data/household_power_consumption_tidy.txt"
  
  if (!file.exists(tidyfilename)) {
  
    #read column names
    fc <- fread(filename, header = TRUE, nrows=1)
    names <- colnames(fc)
    
    # read first column
    fc <- fread(filename, header = TRUE, select = 1)
    
    fc[,Date := as.IDate(Date, format="%d/%m/%Y")]
    # some garbage collection
    gc()
    
    # find which lines we need to read
    fci <- fc[, .I[Date == "2007-02-01" | Date == "2007-02-02"]]
    skip <- fci[1];
    nrows <- length(fci)
    
    # now read subsetted data
    fc <-  fread(filename, header = FALSE, skip=skip, nrows = nrows
                 , na.strings = "?")
    setnames(fc, colnames(fc), names)
  
    write.table(fc, tidyfilename, sep=";", row.names=FALSE, quote=TRUE)
    
  }
  
  fc <- fread(tidyfilename, header=TRUE)
    
  # set column formats
  
  fc[,DateTime := paste(Date, Time)]
  
  fc[,Date := as.IDate(Date, format="%d/%m/%Y")]
  
  fc[,Time := as.ITime(Time, format = "%H:%M:%S")]
  
  gc()
  
  fc
  
}

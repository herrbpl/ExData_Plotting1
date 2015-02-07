# plot1.R
# Course project 1 for explatory data analysis course
# Siim Aus
# This file generates file called plot1.png in same directory
# script is residing in
# Script depends on dataset.R file which should be located on 
# same directory as current R file

source("dataset.R")

#Load data
data <- householddata();

# This is necessary unless you want graphs in your local region format
Sys.setlocale("LC_TIME", "C");

#open PNG file
png(
  filename="plot1.png"
  , width=480
  , height=480
  , units="px"
  )

# Histogram
hist(
  data$Global_active_power
  , col="red"
  , xlab="Global Active Power (kilowatts)"
  , main="Global Active Power"
  )

# Close device
dev.off()

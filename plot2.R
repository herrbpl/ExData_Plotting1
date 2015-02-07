# plot2.R
# Course project 1 for explatory data analysis course
# Siim Aus
# This file generates file called plot2.png in same directory
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
  filename="plot2.png"
  , width=480
  , height=480
  , units="px"
)


# Generate line graph
plot(
  as.POSIXct(data$DateTime, format="%d/%m/%Y %H:%M:%S")
  , data$Global_active_power
  , type="l"
  , ylab="Global Active Power (kilowatts)"
  , xlab=""
  
)

# Close device
dev.off()

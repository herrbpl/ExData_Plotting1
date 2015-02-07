# plot3.R
# Course project 1 for explatory data analysis course
# Siim Aus
# This file generates file called plot3.png in same directory
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
  filename="plot3.png"
  , width=480
  , height=480
  , units="px"
)

# Generate line graph
# NB! have to draw line with largest Y first,
#     otherwise, graph will be stumped on Y axis
plot(
  as.POSIXct(data$DateTime, format="%d/%m/%Y %H:%M:%S")
  , data$Sub_metering_1
  , type="n"
  , ylab="Energy sub metering"
  , xlab=""
)

# Add line
lines(
  as.POSIXct(data$DateTime, format="%d/%m/%Y %H:%M:%S")
  , data$Sub_metering_1
  , col="black"
)

# Add line
lines(
  as.POSIXct(data$DateTime, format="%d/%m/%Y %H:%M:%S")
  , data$Sub_metering_2
  , col="red"
)

# Add line
lines(
  as.POSIXct(data$DateTime, format="%d/%m/%Y %H:%M:%S")
  , data$Sub_metering_3
  , col="blue"
)

# Add legend

legend(
    "topright"
    , lty=c(1,1,1)
    , col = c("black","red", "blue")
    , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  )

# Close device
dev.off()

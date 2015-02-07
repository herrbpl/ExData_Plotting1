# plot4.R
# Course project 1 for explatory data analysis course
# Siim Aus
# This file generates file called plot4.png in same directory
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
  filename="plot4.png"
  , width=480
  , height=480
  , units="px"
)

# give parameters to global plotting system
originalpar <- par()
par(mfrow = c(2,2))

# ========================================================
# Subplot 1
# ========================================================
plot(
  as.POSIXct(data$DateTime, format="%d/%m/%Y %H:%M:%S")
  , data$Global_active_power
  , type="l"
  , ylab="Global Active Power"
  , xlab=""
  
)
# ========================================================
# Subplot 2
# ========================================================
plot(
  as.POSIXct(data$DateTime, format="%d/%m/%Y %H:%M:%S")
  , data$Voltage
  , type="l"
  , ylab="Voltage"
  , xlab="datetime"
  
)

# ========================================================
# Subplot 3
# ========================================================

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
  , bty = "n"
  , cex=0.7
)

# ========================================================
# Subplot 4

# ========================================================
plot(
  as.POSIXct(data$DateTime, format="%d/%m/%Y %H:%M:%S")
  , data$Global_reactive_power
  , type="l"
  , ylab="Global_reactive_power"
  , xlab="datetime"
  
)

# Close device
dev.off()

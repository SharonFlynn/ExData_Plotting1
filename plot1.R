power  <- read.csv("/Users/rain/Desktop/Class Project 1/household_power_consumption.txt", header =TRUE, sep = ";", na.strings="?" )
power[power =="?"]=NA
##Fix the Dates and times
datetime <- paste(power$Date,power$Time)
new  <- strptime(datetime,"%d/%m/%Y %H:%M:%S")
power$newdatetime  <- new
newdate  <-  as.Date(power$Date, "%d/%m/%Y")
power$newdate  <- newdate
str(power)
## create dataset with just Feb 1st and Feb 2nd 2007
powerfeb  <- subset (power, Date =="1/2/2007" | Date =="2/2/2007")
## Convert from Factor to Numeric
powerfeb$Global_active_power =as.numeric(powerfeb$Global_active_power)
powerfeb$Global_reactive_power =as.numeric(powerfeb$Global_reactive_power)
powerfeb$Voltage  =as.numeric(powerfeb$Voltage )
powerfeb$Global_intensity   =as.numeric(powerfeb$ Global_intensity)
powerfeb$Sub_metering_1 =as.numeric(powerfeb$Sub_metering_1)
powerfeb$Sub_metering_2 =as.numeric(powerfeb$Sub_metering_2)
## Modify histogram
hist(powerfeb$Global_active_power/500,  # Save histogram as object
           freq = TRUE,
           col = "Red", 
           main = "Global Active Power",
           xlab = "Global Active Power (kilowats)")
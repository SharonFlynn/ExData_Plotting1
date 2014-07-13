power  <- household_power_consumption
head(power)
power$Global_active_power =as.numeric(power$Global_active_power)
datetime <- paste(power$Date,power$Time)
new  <- strptime(datetime,"%d/%m/%Y %H:%M:%S")
power$newdatetime  <- new
names(power)
## create dataset with just Feb 1st and Feb 2nd 2007
powerfeb  <- subset (power, Date =="1/2/2007" | Date =="2/2/2007")
power$Global_active_power =as.numeric(power$Global_active_power)
require(ggplot2)
plot (x= powerfeb$newdatetime,y= powerfeb$Global_active_power/500,type ="l", 
                xlab="",
             ylab = "Global Active Power (kilowats)")
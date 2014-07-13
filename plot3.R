power  <- household_power_consumption
head(power)
power$Global_active_power =as.numeric(power$Global_active_power)
datetime <- paste(power$Date,power$Time)
new  <- strptime(datetime,"%d/%m/%Y %H:%M:%S")
power$newdatetime  <- new
names(power)
## create dataset with just Feb 1st and Feb 2nd 2007
powerfeb  <- subset (power, Date =="1/2/2007" | Date =="2/2/2007")
#Change factor to numeric 
power$Sub_metering_1 =as.numeric(power$Sub_metering_1)
power$Sub_metering_2 =as.numeric(power$Sub_metering_2)
power$Sub_metering_3 =as.numeric(power$Sub_metering_3)
powerfeb$Sub_metering_1 =as.numeric(powerfeb$Sub_metering_1)
powerfeb$Sub_metering_2 =as.numeric(powerfeb$Sub_metering_2)
powerfeb$Sub_metering_3 =as.numeric(powerfeb$Sub_metering_3)
#Create line chart
plot (x= powerfeb$newdatetime, y= powerfeb$Sub_metering_1,type ="l",
      xlab ="",
      ylab = "Energy sub metering")
## add additional lines
lines ( x= powerfeb$newdatetime,,y= powerfeb$Sub_metering_2, col ="red")
lines ( x= powerfeb$newdatetime, y= powerfeb$Sub_metering_3, col ="blue")
## Add Legend 
legend("topright" , # places a legend at the appropriate place 
       c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
       
       lty=c(1,1,2), # gives the legend appropriate symbols (lines)
       bty="n",
       lwd=c(2.5,2.5,2.5),col=c("black", "red","blue")) # gives the legend lines the correct 
# color and width
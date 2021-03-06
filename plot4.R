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
#Create line chart
plot (x= powerfeb$newdatetime, y= powerfeb$Sub_metering_1,type ="l",
      xlab ="",
      ylab = "Energy sub metering")
## add additional lines
lines ( x= powerfeb$newdatetime, y= powerfeb$Sub_metering_2, col ="red")
lines ( x= powerfeb$newdatetime, y= powerfeb$Sub_metering_3, col ="blue")
## Add Legend 
legend("topright" , # places a legend at the appropriate place 
       c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
       
       lty=c(1,1,2), # gives the legend appropriate symbols (lines)
       bty="n",
       lwd=c(2.5,2.5,2.5),col=c("black", "red","blue")) # gives the legend lines the correct 
# color and width
## Set up for panels 
attach(powerfeb)
par(mfrow =c(2, 2)) #2x2 pictures on one plot 
par(mar= (2,2,2,2))
#Plot Global Active Power
plot (x= powerfeb$newdatetime,y= powerfeb$Global_active_power/500,type ="l", 
            xlab="",
      ylab = "Global Active Power")

#Plot Voltage
plot (x= powerfeb$newdatetime,y= powerfeb$Voltage/10,type ="l", 
                    xlab="datetime",
                      ylab = "Voltager")

#plot Energy sub metering
plot (x= powerfeb$newdatetime, y= powerfeb$Sub_metering_1,type ="l",
      xlab ="",
      ylab = "Energy sub metering")

## add additional lines
lines (x= powerfeb$newdatetime, y= powerfeb$Sub_metering_2, col ="red")
lines (x= powerfeb$newdatetime, y= powerfeb$Sub_metering_3, col ="blue")
## Add Legend 
legend("topright" , # places a legend at the appropriate place 
       c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
       lty=c(1,1,2), # gives the legend appropriate symbols (lines)
       bty="n",
       lwd=c(1.5,1.5,1.5),col=c("black", "red","blue")) # gives the legend
##lines the correct color and width      
      cex= 0.75 ## adjusts legend size to fit smaller space
#Plot Global Rective Power
         plot (x= powerfeb$newdatetime,y= powerfeb$Global_reactive_power/500,type ="l", 
                       xlab="",
                      ylab = "Global_reative_Power")                                                                                                                                                                                                                                                          

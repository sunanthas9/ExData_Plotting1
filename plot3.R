library(sqldf)
power <- read.csv.sql("household_power_consumption.txt", 
                      sql = "select * from file where Date ='1/2/2007'or Date ='2/2/2007'" , 
                      header = TRUE, sep = ";")

library(lubridate)
power$datetime <- paste(power$Date, power$Time, sep =',')
power$datetime <- dmy_hms(power$datetime)
power$Date <- dmy(power$Date)
power$Time <- hms(power$Time)


png(filename = "plot3.png")
plot(power$datetime, power$Sub_metering_1, type = "l", 
     xlab = "", ylab ="Energy sub metering")
lines(power$datetime, power$Sub_metering_2, type = "l", 
      col= "Red", xlab = "", ylab ="Global Active Power (kilowatts)")
lines(power$datetime, power$Sub_metering_3, type = "l", 
      col= "Blue", xlab = "", ylab ="Global Active Power (kilowatts)")
legend("topright", inset = c(0,0), lty = 1, col = c("Black","Red", "Blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

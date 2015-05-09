library(sqldf)
power <- read.csv.sql("household_power_consumption.txt", 
                      sql = "select * from file where Date ='1/2/2007'or Date ='2/2/2007'" , 
                      header = TRUE, sep = ";")

library(lubridate)
power$datetime <- paste(power$Date, power$Time, sep =',')
power$datetime <- dmy_hms(power$datetime)
power$Date <- dmy(power$Date)
power$Time <- hms(power$Time)


png(filename = "plot2.png")
plot(power$datetime, power$Global_active_power, type = "l", 
     xlab = "", ylab ="Global Active Power (kilowatts)")
dev.off()


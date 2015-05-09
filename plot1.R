library(sqldf)
power <- read.csv.sql("household_power_consumption.txt", 
                      sql = "select * from file where Date ='1/2/2007'or Date ='2/2/2007'" , 
                      header = TRUE, sep = ";")

library(lubridate)
power$datetime <- paste(power$Date, power$Time, sep =',')
power$datetime <- dmy_hms(power$datetime)
power$Date <- dmy(power$Date)
power$Time <- hms(power$Time)


png(filename = "plot1.png")
hist(power$Global_active_power, ylim = c(0,1200), xlim = c(0,6), 
     xlab= "Global Active Power (kilowatts)", col="Red", 
     main = "Global Active Power")
dev.off()

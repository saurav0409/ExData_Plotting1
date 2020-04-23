library("data.table")

setwd("~/Desktop/coursera/dataanalysis/data")

pllt <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
                             )

pllt[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

pllt[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

pllt <- pllt[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

hist(pllt[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()


library("data.table")

setwd("~/Desktop/coursera/dataanalysi/data")

pow <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

pow[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

pow[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

pow <- pow[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

plot(x = pow[, dateTime]
     , y = pow[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()


library("data.table")

setwd("~/Desktop/coursera/dataanalysis/data")

power<- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

power[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

power[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

power <- power[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)

# Plot 3
plot(power[, dateTime], powerDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(power[, dateTime], powerDT[, Sub_metering_2],col="red")
lines(power[, dateTime], powerDT[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()

library("data.table")

setwd("~/Desktop/coursera/dataanalysis/data")


a <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)


a[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

a[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

a <- a[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(a[, dateTime], a[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

plot(a[, dateTime],a[, Voltage], type="l", xlab="datetime", ylab="Voltage")

plot(a[, dateTime], a[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(a[, dateTime], a[, Sub_metering_2], col="red")
lines(a[, dateTime], a[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(a[, dateTime], a[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

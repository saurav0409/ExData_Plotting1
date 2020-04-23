library("data.table")
setwd("~/Desktop/coursera/dataanalysi/data")
pow <- data.table::fread(input = "household_power_consumption.txt" , na.strings="?" )
pow[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
pow[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
pow <- pow[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot2.png", width=480, height=480)
plot(x = pow[, dateTime] , y = pow[, Global_active_power] , type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

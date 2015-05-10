setwd("F:/study/Coursera/EDA/PA1")
library(data.table)
DT <- fread("household_power_consumption.txt")
DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")
DTS <- DT[((DT$Date >= "2007-02-01") & 
             (DT$Date <= "2007-02-02")),]
DTS$Global_active_power <- as.numeric(DTS$Global_active_power)
# head(DTS)
# str(DTS)
DTS$datetime <- as.POSIXct(paste(DTS$Date,DTS$Time))

png("plot3.png", width=480, height=480)
plot(DTS$datetime, 
     as.numeric(DTS$Sub_metering_1),
     type = "l",
     ylab = "Energy Sub metering",
     xlab = "")
lines(DTS$datetime, 
      as.numeric(DTS$Sub_metering_2),
      col = "red")
lines(DTS$datetime, 
      as.numeric(DTS$Sub_metering_3),
      col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2",
                  "Sub_metering_3"),
       col = c("black", "red", "blue"), 
       lty = 1, 
       lwd = 2)
dev.off()


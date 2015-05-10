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

plot(DTS$datetime, 
     DTS$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.copy(png, 
         file = "plot2.png",
         height = 480, 
         width = 480)
dev.off()

setwd("F:/study/Coursera/EDA/PA1")
# getwd()
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(fileUrl, "consumption.zip")
# unzip("consumption.zip")
library(data.table)
DT <- fread("household_power_consumption.txt")
DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")
DTS <- DT[((DT$Date >= "2007-02-01") & 
            (DT$Date <= "2007-02-02")),]
# head(DTS)
# unique(DTS$Date)
# str(DTS)
DTS$Global_active_power <- as.numeric(DTS$Global_active_power)

hist(DTS$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.copy(png, 
         file = "plot1.png", 
         height = 480, 
         width = 480)
dev.off()

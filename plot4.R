setwd('E:\\course era\\Exploratorydatanalysis\\w1\\exdata%2Fdata%2Fhousehold_power_consumption')
data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
library(lubridate)
str(data)
data_names<-names(data)
data_names
#removing unecessary variables
data1 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data1 <- data1 %>% mutate(Datetime = as.POSIXct(dmy_hms(as.character(paste(Date, Time)))),
                          Sub_metering_1 = as.numeric(as.character(Sub_metering_1)),
                          Sub_metering_2 = as.numeric(as.character(Sub_metering_2)),
                          Sub_metering_3 = as.numeric(as.character(Sub_metering_3)),
                          Global_active_power= as.numeric(as.character(Global_active_power)),
                          Global_reactive_power= as.numeric(as.character(Global_reactive_power)),
                          Voltage= as.numeric(as.character(Voltage)),
                          Global_intensity=as.numeric(as.character(Global_intensity)))
#ploting the plot as per the recquirement mentioned
png("plot3.png", width=480, height=480)
par(mfrow = c(2, 2))

with(data1, plot(Datetime,Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

with(data1, plot(Datetime,Voltage, type="l", xlab = "datetime", ylab = "Voltage"))

with(data1, plot(Datetime,Sub_metering_1, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(data1, points(Datetime,Sub_metering_1, col="black", type="l"))
with(data1, points(Datetime,Sub_metering_2, col="red", type="l"))
with(data1, points(Datetime,Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

with(data1, plot(Datetime,Global_reactive_power, type="l", xlab = "datetime", ylab = "Global reactive power"))
dev.off()

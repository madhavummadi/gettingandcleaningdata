setwd('E:\\course era\\Exploratorydatanalysis\\w1\\exdata%2Fdata%2Fhousehold_power_consumption')
data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
library(lubridate)
str(data)
data_names<-names(data)
data_names
#removing unecessary variables
data1 <- subset(data[c('Global_active_power','Time','Date')], Date %in% c("1/2/2007","2/2/2007"))
str(data1)
#time to change data types of variables
data1$Global_active_power<-as.numeric(as.character(data1$Global_active_power))
library(lubridate)
data1$Datetime<-as.POSIXct(dmy_hms(as.character(paste(data1$Date, data1$Time))))                                      
str(data1)
#plotting
png("plot2.png", width=480, height=480)
with(data1, plot(Datetime,Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

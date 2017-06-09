setwd('E:\\course era\\Exploratorydatanalysis\\w1\\exdata%2Fdata%2Fhousehold_power_consumption')
data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
str(data)
#we observe that the variables are of wrong data type,we will change date&time datatype.
data$Date<-as.Date(data$Date)
data$Time<-strptime(data$Time,format ="%H:%M:%S")
datetime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(datetime)
global_Active_Power <- as.numeric(data$Global_active_power)
#plotting the histogram as per given criteria
png("plot1.png", width=480, height=480)
hist(global_Active_Power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()

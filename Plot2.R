#Plot2

#Reading and Cleaning Data
data = read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data = subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date2 = as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime = ymd_hms(paste(data$Date2,data$Time))
data$Global_active_power = as.numeric(as.character(data$Global_active_power))
library(lubridate)
data$DateTime = ymd_hms(paste(data$Date2,data$Time))
class(data$DateTime)
data$Day = format(data$Date, "%a ")                          

#Plotting

plot(data$DateTime,data$Global_active_power,type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$DateTime,data$Global_active_power)
dev.copy(png, file = "Plot2.png", width = 480, height = 480, units = "px")
dev.off()
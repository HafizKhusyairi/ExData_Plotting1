#Plot3

#Reading And Cleaning Data
data = read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data = subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date2 = as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime = ymd_hms(paste(data$Date2,data$Time))
data$Sub_metering_1 = as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 = as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 = as.numeric(as.character(data$Sub_metering_3))

#Plotting
plot(data$DateTime, data$Sub_metering_1,type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lwd=c(2.5,2.5), col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.75)
dev.copy(png, file = "Plot3.png", width = 480, height = 480, units = "px")
dev.off()
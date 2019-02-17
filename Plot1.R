#Plot1

#Reading And Cleaning Data
data = read.table("household_power_consumption.txt", sep = ";", header = TRUE)
head(data)
class(data$Date)
data = subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date2 = as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power = as.numeric(as.character(data$Global_active_power))

#Plotting
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "Plot1.png", width = 480, height = 480, units = "px")
dev.off()
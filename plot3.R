
## Plot 3 for Exploratory data analysis course - Coursera ##

setwd('/Users/Jose/Documents/R_tutorial/R_exploratory/Session_1/')

plot_data <- read.table("household_power_consumption.txt", sep = ";",
                        , na.strings = "?", header = TRUE)
plot_data$time_date <- paste(plot_data$Date ,plot_data$Time )

# Changing time and format so year does not appear
plot_data$Time <- strptime(plot_data$Time,  "%H:%M:%S")
plot_data$time_date <- strptime(plot_data$time_date,  "%d/%m/%Y %H:%M:%S")
# Converting dates
plot_data$Date <- as.Date(plot_data$Date, "%d/%m/%Y")

# Subsetting data sets for the corresponding dates 
plot_data_feb <- subset(plot_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

#Plotting figure
png("plot3.png", width=480)
plot(plot_data_feb$time_date, plot_data_feb$Sub_metering_1, typ='l',
     ylab = "Energy sub metering", xlab = "")
lines(plot_data_feb$time_date, plot_data_feb$Sub_metering_2, typ='l',
     xlab = "", col = "red")
lines(plot_data_feb$time_date, plot_data_feb$Sub_metering_3, typ='l'
      , xlab = "", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ),
       lty=c(1,1,1), lwd=c(1.5,1.5), col=c("black","blue","red"), cex = 0.85
       , y.intersp = 0.95)
dev.off()




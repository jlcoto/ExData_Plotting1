
## Plot 1 for Exploratory data analysis course - Coursera ##

setwd('/Users/Jose/Documents/R_tutorial/R_exploratory/Session_1/')

plot_data <- read.table("household_power_consumption.txt", sep = ";",
                        , na.strings = "?", header = TRUE)
# Changing time and format so year does not appear
plot_data$Time <- strptime(plot_data$Time,  "%H:%M:%S")
plot_data$Time <- format(plot_data$Time , format="%H:%M:%S")

# Converting dates
plot_data$Date <- as.Date(plot_data$Date, "%d/%m/%Y")

# Subsetting data sets for the corresponding dates 
plot_data_feb <- subset(plot_data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

#Plotting histogram of global active power
png("plot1.png", width=480)
hist(plot_data_feb$Global_active_power, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
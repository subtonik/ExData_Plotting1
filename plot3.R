# Coursea EDA: Assignment 1: plot 3

# just to load the data from 2007-02-01 to 2007-02-02
df <- read.table(file="household_power_consumption.txt",
                 header = FALSE,sep=";",skip = 66637, nrow = 2880,stringsAsFactors = FALSE)
dfName <- read.table(file="household_power_consumption.txt",header = TRUE,sep=";", nrow = 1)
names(df)<-names(dfName)

# convert to date
DateTime <- paste(df[,"Date"],df[,"Time"])
df <- data.frame(df,DateTime,stringsAsFactors = FALSE)
df[,1] <- as.POSIXct(df[,1],format="%d/%m/%Y")
df[,"DateTime"] <- as.POSIXct(df[,"DateTime"],format="%d/%m/%Y %H:%M:%S")

# plot
png(filename = "plot3.png", width = 480, height = 480)
yLabel <- "Energy sub metering"
xLabel <- ""
#mainTitle <- ""
plot(df$DateTime, df$Sub_metering_1, xlab = xLabel, ylab = yLabel, type = "l", col = "black")
lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()

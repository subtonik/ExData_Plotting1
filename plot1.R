# Coursea EDA: Assignment 1: plot 1

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
png(filename = "myplot1.png", width = 480, height = 480)
xLabel <- "Global Active Power (kilowatts)"
yLabel <- "Frequency"
mainTitle <- "Global Active Power"
hist(df$Global_active_power,main = mainTitle, xlab = xLabel, ylab = yLabel, col = "red")
dev.off()

## Read dataset
dat<- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

## Subset the data
data <- subset(dat, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dat)

## Convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
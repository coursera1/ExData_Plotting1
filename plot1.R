## Explanortary Data Analysis Assignemnt 1

## Plot 1

## Load Data
dat<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

## Subset for 2007-02-01 and 2007-02-02
date1<-"1/2/2007"
date2<-"2/2/2007"
subdat<-dat[dat$Date==date1|dat$Date==date2,]

## Plot on windows
windows(
        width     = 480,
        height    = 480,
        pointsize = 12
)
hist(subdat$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


## Plot in file
dev.copy(device=png,"plot1.png", width=480, height=480, pointsize=8, units="px")
dev.off()
dev.off()

## Explanortary Data Analysis Assignemnt 1

## Plot 3


## Load Data
dat<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

## Subset for 2007-02-01 and 2007-02-02
date1<-"1/2/2007"
date2<-"2/2/2007"
subdat<-dat[dat$Date==date1|dat$Date==date2,]
subdat$DateHour<-strptime(paste(subdat$Date,subdat$Time),"%d/%m/%Y %H:%M:%S")

## To get it right because I'm in Belgium ("Thu" is "Jeu", "Fri" is "Ven" and "Sat" is "Sam")
Sys.setlocale("LC_TIME", "English") 

## Plot on windows
windows(
        width     = 7,
        height    = 7,
        pointsize = 12
)
plot(subdat$DateHour, subdat$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(subdat$DateHour, subdat$Sub_metering_2, col="red")
lines(subdat$DateHour, subdat$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))


## Plot in file
dev.copy(device=png,"plot3.png", width=480, height=480, pointsize=8, units="px")
dev.off()
dev.off()


## Get my default LOCALS back
Sys.setlocale("LC_TIME","French_Belgium.1252")
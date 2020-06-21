## Code to construct plot3.
## time series of the sub meterings for the two days of interest

rm(list=ls())
graphics.off()

dir="C:/Users/dk/Documents/Coursera/Data science/ExploratoryDataAnalysis/ExData_Plotting1"
setwd(dir)

## read file
household_power_consumption=read.table("household_power_consumption.txt", sep=";", header=T, colClasses = "character")

## convert to the right class
# convert to numeric columns 3-9
for (i in 3:9) household_power_consumption[,i]=as.numeric(household_power_consumption[,i])
# convert column 1 to date 
household_power_consumption[,1]=as.Date(household_power_consumption[,1], "%d/%m/%Y")

## keep only the dates of interest (1st and 2nd of February 2007)
power_consumption_0102_02_07=household_power_consumption[household_power_consumption[,1]>="2007-02-01" & household_power_consumption[,1]<="2007-02-02", ]

dates=as.character(power_consumption_0102_02_07$Date)
times=power_consumption_0102_02_07$Time

date_time=paste(dates, times)
date_time_pos=strptime(date_time, "%Y-%m-%d %H:%M:%S")

power_consumption_0102_02_07=cbind(date_time_pos, power_consumption_0102_02_07)
power_consumption_0102_02_07=power_consumption_0102_02_07[,-c(2,3)]

## plot
png("plot3.png", width=480, height=480, type="cairo")

plot(power_consumption_0102_02_07$date_time_pos, power_consumption_0102_02_07$Sub_metering_1, ylab="Energy sub metering", xlab="", main="", type="l")
lines(power_consumption_0102_02_07$date_time_pos, power_consumption_0102_02_07$Sub_metering_2, col="red")
lines(power_consumption_0102_02_07$date_time_pos, power_consumption_0102_02_07$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c(1, "red", "blue"), lty=1)

dev.off()
